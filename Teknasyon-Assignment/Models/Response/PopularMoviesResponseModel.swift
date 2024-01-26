//
//  PopularMoviesResponseModel.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

struct PopularMoviesResponseModel: Codable, Hashable {
    let id: String? = UUID().uuidString
    let page: Int?
    let results: [PopularMoviesDetailModel]?
    let totalPages: Int?
    let totalResults: Int?
}

struct PopularMoviesDetailModel: Codable, Hashable {
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let firstAirDate: String?
    let name: String?
    let voteAverage: Double?
    let voteCount: Int?
}
