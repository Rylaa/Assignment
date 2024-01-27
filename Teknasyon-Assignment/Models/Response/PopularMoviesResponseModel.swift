//
//  PopularMoviesResponseModel.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

struct PopularMoviesResponseModel: Codable, Hashable {
    let id: String? = UUID().uuidString
    let results: [PopularMoviesDetailModel]?
    let totalPages: Int?
    let totalResults: Int?
    let page: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case page
    }
}

struct PopularMoviesDetailModel: Codable, Hashable {
    let gender: Int?
    let originalName: String?
    let id: Int?
    let adult: Bool?
    let knownForDepartment: String?
    let popularity: Double?
    let profilePath: String?
    let name: String?
    let movies: [MovieModel]?

    enum CodingKeys: String, CodingKey {
        case gender
        case originalName = "original_name"
        case id
        case adult
        case knownForDepartment = "known_for_department"
        case popularity
        case profilePath = "profile_path"
        case name
        case movies = "known_for"
    }
}

struct MovieModel: Codable, Hashable {
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let originalTitle: String?
    let mediaType: String?
    let genreIds: [Int]?
    let voteAverage: Double?
    let popularity: Double?
    let posterPath: String?
    let title: String?
    let overview: String?
    let originalLanguage: String?
    let voteCount: Int?
    let releaseDate: String?
    let video: Bool?
    let originCountry: [String]?
    let firstAirDate: String?
    let originalName: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case mediaType = "media_type"
        case genreIds = "genre_ids"
        case voteAverage = "vote_average"
        case popularity
        case posterPath = "poster_path"
        case title
        case overview
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case video
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case originalName = "original_name"
        case name
    }
}
