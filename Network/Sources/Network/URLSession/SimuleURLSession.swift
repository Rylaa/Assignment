//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public class SimuleURLSession: URLProtocol {
    public static var stubResponseData: Data?
    public static var stubURLResponse: HTTPURLResponse?
    public static var stubError: Error?

    public override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    public override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    public override func startLoading() {
        if let stubError = Self.stubError {
            client?.urlProtocol(self, didFailWithError: stubError)
        } else {
            client?.urlProtocol(self, didLoad: Self.stubResponseData ?? Data())
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    public override func stopLoading() {}
}
