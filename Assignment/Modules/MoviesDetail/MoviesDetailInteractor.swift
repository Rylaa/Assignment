//
//  MoviesDetailInteractor.swift
//  -Assignment
//
//  Created by Yusuf Demirkoparan on 27.01.2024.
//

import Combine
import Core
import Foundation

protocol MoviesDetailInteractorProtocol {
    var presenter: MoviesDetailPresenterProtocol? { get }
    var movieDetail: MovieModel { get }
}

final class MoviesDetailInteractor {
    weak var presenter: MoviesDetailPresenterProtocol?
    let movieDetail: MovieModel

    init(_ movieDetail: MovieModel) {
        self.movieDetail = movieDetail
    }
}

extension MoviesDetailInteractor: MoviesDetailInteractorProtocol {}
