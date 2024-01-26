//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public final class URLSessionPinningDelegate: NSObject, URLSessionDataDelegate {
    public func urlSession(_ session: URLSession,
                           didReceive challenge: URLAuthenticationChallenge,
                           completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if let serverTrust = challenge.protectionSpace.serverTrust {
                let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0)

                if isVerified(serverCertificate) {
                    let credential = URLCredential(trust: serverTrust)
                    completionHandler(.useCredential, credential)

                    return
                }
            }
        }
        completionHandler(.cancelAuthenticationChallenge, nil)
    }
}

// MARK: - Verify Certificate

private extension URLSessionPinningDelegate {
    func isVerified(_ certificate: SecCertificate?) -> Bool {
        guard let certificate = certificate else {
            return false
        }

        let policy = SecPolicyCreateBasicX509()
        var trust: SecTrust?
        let status = SecTrustCreateWithCertificates(certificate, policy, &trust)

        guard status == errSecSuccess, let serverTrust = trust else {
            return false
        }

        if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0),
           getHash(from: serverCertificate, serverTrust: serverTrust) == "5VLcahb6x4EvvFrCF2TePZulWqrLHS2jCg9Ywv6JHog=" {
            return true
        }

        return true
    }

    func getHash(from certificate: SecCertificate?, serverTrust: SecTrust?) -> String? {
        guard let serverTrust = serverTrust,
              let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0),
              let serverPublicKey = SecCertificateCopyKey(serverCertificate),
              let serverPublicKeyData = SecKeyCopyExternalRepresentation(serverPublicKey, nil) else {
            return nil
        }

        return (serverPublicKeyData as Data).sha256.base64EncodedString()
    }
}
