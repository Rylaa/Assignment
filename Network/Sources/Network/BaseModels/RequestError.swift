//
//  File.swift
//  
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation
import Core

public enum RequestError: Error {
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
        case .invalidStatusCode(let statusCode):
            return "\(statusCode) with invalid status code error occured."
        case .misFunctionedUrl(let urlError):
            return "\(urlError.localizedDescription) in the URL error domain."
        case .parsingError(let parsingError):
            return "\(parsingError.localizedDescription) parsing error."
        case .noRequest:
            return "There is no urlsession."
        }
    }
}
