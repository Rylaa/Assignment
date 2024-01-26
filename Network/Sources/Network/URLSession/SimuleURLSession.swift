//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

class SimuleURLSession: URLProtocol {
    static var stubResponseData: Data?
    static var stubURLResponse: HTTPURLResponse?
    static var stubError: Error?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let stubError = Self.stubError {
            client?.urlProtocol(self, didFailWithError: stubError)
        } else {
            client?.urlProtocol(self, didLoad: Self.stubResponseData ?? Data())
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
