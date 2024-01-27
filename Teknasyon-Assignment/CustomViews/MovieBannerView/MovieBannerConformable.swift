//
//  MovieBannerConformable.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Core
import Foundation
import Network

protocol MovieBannerConformableProtocol {
    var bannerUrl: String { get }
    var vote: Int { get }
    var averageOfVote: Double { get }
    var movieName: String { get }
}

extension MovieModel: MovieBannerConformableProtocol {
    var averageOfVote: Double {
        voteAverage.toDoubleValueOrZero
    }

    var vote: Int {
        voteCount.toIntValueOrZero
    }

    var movieName: String {
        originalTitle.toStringValueOrEmpty
    }

    var bannerUrl: String {
        ApiConstants.imageBaseUrl + posterPath.toStringValueOrEmpty
    }
}
