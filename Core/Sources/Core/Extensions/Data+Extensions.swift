//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import CommonCrypto
import Foundation

public extension Data {
    var sha256: Data {
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(self.count), &hash)
        }
        return Data(hash)
    }

    func prettyPrinted() {
        if let json = try? JSONSerialization.jsonObject(with: self, options: []),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            Log.debug("#### ------------------------ Response: \n\n \(jsonString) \n\n ------------------------ ####")
        }
    }
}
