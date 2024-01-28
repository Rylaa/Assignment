//
//  PopularMoviesResponseModel.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//
// swiftlint:disable all
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

    init(results: [PopularMoviesDetailModel]? = nil,
         totalPages: Int? = nil,
         totalResults: Int? = nil,
         page: Int? = nil) {
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
        self.page = page
    }
}

struct PopularMoviesDetailModel: Codable, Hashable {
    let gender: Int?
    let originalName: String?
    let id: Int?
    let knownForDepartment: String?
    let popularity: Double?
    let profilePath: String?
    let name: String?
    let movies: [MovieModel]?

    enum CodingKeys: String, CodingKey {
        case gender
        case originalName = "original_name"
        case id
        case knownForDepartment = "known_for_department"
        case popularity
        case profilePath = "profile_path"
        case name
        case movies = "known_for"
    }

    init(gender: Int? = nil,
         originalName: String? = nil,
         id: Int? = nil,
         knownForDepartment: String? = nil,
         popularity: Double? = nil,
         profilePath: String? = nil,
         name: String? = nil,
         movies: [MovieModel]? = nil) {
        self.gender = gender
        self.originalName = originalName
        self.id = id
        self.knownForDepartment = knownForDepartment
        self.popularity = popularity
        self.profilePath = profilePath
        self.name = name
        self.movies = movies
    }
}

struct MovieModel: Codable, Hashable {
    let uuid: String? = UUID().uuidString
    let id: Int?
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
    let originCountry: [String]?
    let firstAirDate: String?
    let originalName: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
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
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case originalName = "original_name"
        case name
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    init(id: Int? = nil,
         backdropPath: String? = nil,
         originalTitle: String? = nil,
         mediaType: String? = nil,
         genreIds: [Int]? = nil,
         voteAverage: Double? = nil,
         popularity: Double? = nil,
         posterPath: String? = nil,
         title: String? = nil,
         overview: String? = nil,
         originalLanguage: String? = nil,
         voteCount: Int? = nil,
         releaseDate: String? = nil,
         originCountry: [String]? = nil,
         firstAirDate: String? = nil,
         originalName: String? = nil,
         name: String? = nil) {
        self.id = id
        self.backdropPath = backdropPath
        self.originalTitle = originalTitle
        self.mediaType = mediaType
        self.genreIds = genreIds
        self.voteAverage = voteAverage
        self.popularity = popularity
        self.posterPath = posterPath
        self.title = title
        self.overview = overview
        self.originalLanguage = originalLanguage
        self.voteCount = voteCount
        self.releaseDate = releaseDate
        self.originCountry = originCountry
        self.firstAirDate = firstAirDate
        self.originalName = originalName
        self.name = name
    }
}
