//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Core
import Foundation

protocol ErrorModifier: Error, LocalizedError, CustomNSError, Equatable {}

public enum RequestError: ErrorModifier {
    case unknown(NSError)
    case misFunctionedUrl(URLError)
    case notConnectedToInternet
    case notReachedServer
    case connectionLost
    case noRequest
    case incorrectDataReturned
    case parsingError(Error)
    case invalidStatusCode(Int)

    var message: String {
        Spinner.stop()

        switch self {
        case .unknown, .incorrectDataReturned:
            return "Something went wrong."
        case .notConnectedToInternet, .notReachedServer, .connectionLost:
            return "Network error occured"
        case let .invalidStatusCode(statusCode):
            return "\(statusCode) with invalid status code error occured."
        case let .misFunctionedUrl(urlError):
            return "\(urlError.localizedDescription) in the URL error domain."
        case let .parsingError(parsingError):
            return "\(parsingError.localizedDescription) parsing error."
        case .noRequest:
            return "There is no urlsession."
        }
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.errorCode == rhs.errorCode
    }
}
