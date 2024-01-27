//
//  MoviesDetailRouter.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 27.01.2024.
//

import UIKit

protocol MoviesDetailRouterProtocol: AnyObject {}

final class MoviesDetailRouter: MoviesDetailRouterProtocol {
    var navigationController: UINavigationController?
    weak var viewController: UIViewController?
}

extension MoviesDetailRouter {
    static func buildMoviesDetail(using navigationController: UINavigationController?, movieDetail: MovieModel) -> MoviesDetailViewController {
        let router = MoviesDetailRouter()
        let interactor = MoviesDetailInteractor(movieDetail)
        let presenter = MoviesDetailPresenter(interactor: interactor, router: router)
        let view = MoviesDetailViewController()
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.navigationController = navigationController
        router.viewController = view

        return view
    }
}
