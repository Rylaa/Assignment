//
//  FavoriteMoviesPresenter.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation
import Network
import Core

protocol PopularMoviesPresenterProtocol: AnyObject {
    var view: PopularMoviesViewProtocol? { get }
  
    func initialize()
    func collectionViewDataSource(_ dataSource: PopularMoviesCollectionViewDatasource)
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
    
    func addItems(_ items: [FavoriteMoviesDetailModel]) {
        collectionViewDataSource?.update([Section(items: items)])
    }
}

/// Contracts with collection view datasource
extension PopularMoviesPresenter: FavoriteMoviesViewDatasourceProtocol {
    func didSelectItem(_ selectedItem: URL) {
    }
}