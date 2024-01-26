//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public struct ApiConstants {
    private static let apiKey = "9a144f2692833ce4250b0a65e532e809"
    public static let apiScheme: String = "https"
    public static let apiHost: String = "api.themoviedb.org"
    public static let baseUrl: String = "3/account"
    public static let imageBaseUrl = "https://image.tmdb.org/t/p/original/"
    public enum Path: String {
        case favorite = "favorite/movies"
        case detail = ""
    }
}
