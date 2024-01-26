//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public struct ApiConstants { 
    public static let apiScheme: String = "https"
    public static let apiHost: String = "api.themoviedb.org"
    public static let baseUrl: String = "3/person/"
    
    public static let imageBaseUrl = "https://image.tmdb.org/t/p/original/"
   
    public enum Path: String {
        case popular
    }
}
//--url 'https://api.themoviedb.org/3/person/popular?language=en-US&page=1' \
