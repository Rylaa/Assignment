//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public final class NetworkDefaults: NSObject, URLSessionDelegate {
    public static func defaultHeaders() -> [HTTPHeader] {
        var headers = [HTTPHeader]()
        headers.append(HTTPHeader(name: "Content-Type", value: "application/json"))

        return headers
    }

    public static func urlComponents(with path: String, parameters: [String: Any]?) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = ApiConstants.apiScheme
        urlComponents.host = ApiConstants.apiHost
        urlComponents.path = "/" + path
        urlComponents.queryItems = get(params: parameters)

        return urlComponents
    }

    static func get(params: [String: Any]?) -> [URLQueryItem]? {
        guard let params = params else { return nil }

        var queryItems = [URLQueryItem]()
        for (key, value) in params {
            queryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }

        return queryItems
    }
}
