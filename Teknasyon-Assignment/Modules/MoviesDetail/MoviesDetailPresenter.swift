//
//  MoviesDetailPresenter.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 27.01.2024.
//

import Core
import Foundation
import Network

protocol MoviesDetailPresenterProtocol: AnyObject {
    var view: MoviesDetailViewProtocol? { get }

    func initialize()
}

final class MoviesDetailPresenter {
    var view: MoviesDetailViewProtocol?
    var router: MoviesDetailRouterProtocol
    var interactor: MoviesDetailInteractorProtocol
    var movieDetail: MovieModel { interactor.movieDetail }

    init(interactor: MoviesDetailInteractorProtocol, router: MoviesDetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

/// Contracts with interactor only
extension MoviesDetailPresenter: MoviesDetailPresenterProtocol {
    func initialize() {
        view?.provideMovieDetails(movieDetail)
    }
}
