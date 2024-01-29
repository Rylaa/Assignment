//
//  PopularMoviesPresenter.swift
//  -Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Core
import Foundation
import Network

protocol PopularMoviesPresenterProtocol: AnyObject {
    var view: PopularMoviesViewProtocol? { get }

    func initialize()
    func collectionViewDataSource(_ dataSource: PopularMoviesCollectionViewDatasource)
    func addCollectionViewSections(_ sections: [Section<PopularMoviesCollectionHeaderModel?, [MovieModel]>])
}

final class PopularMoviesPresenter {
    private var collectionViewDataSource: PopularMoviesCollectionViewDatasource?
    var view: PopularMoviesViewProtocol?
    var router: PopularMoviesRouterProtocol
    var interactor: PopularMoviesInteractorProtocol

    init(interactor: PopularMoviesInteractorProtocol, router: PopularMoviesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

/// Contracts with interactor only
extension PopularMoviesPresenter: PopularMoviesPresenterProtocol {
    func initialize() {
        interactor.fetchPopularMovies()
    }

    func collectionViewDataSource(_ dataSource: PopularMoviesCollectionViewDatasource) {
        collectionViewDataSource = dataSource
        collectionViewDataSource?.delegate = self
    }

    func addCollectionViewSections(_ sections: [Section<PopularMoviesCollectionHeaderModel?, [MovieModel]>]) {
        collectionViewDataSource?.add(sections)
    }
}

/// Contracts with collection view datasource
extension PopularMoviesPresenter: PopularMoviesViewDatasourceProtocol {
    func didSelectItem(_ item: MovieModel) {
        router.showDetail(item)
    }

    func loadMore() {
        interactor.fetchPopularMovies()
    }
}
