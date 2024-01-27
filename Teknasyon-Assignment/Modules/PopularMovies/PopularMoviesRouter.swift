//
//  PopularMoviesRouter.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit

protocol PopularMoviesRouterProtocol: AnyObject {
    func showDetail(_ movieDetail: MovieModel)
}

final class PopularMoviesRouter: PopularMoviesRouterProtocol {
    var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    private var context: Context?

    func showDetail(_ movieDetail: MovieModel) {
        let buildDetail = MoviesDetailRouter.buildMoviesDetail(using: navigationController, movieDetail: movieDetail)
        navigationController?.pushViewController(buildDetail, animated: true)
    }
}

extension PopularMoviesRouter {
    static func buildPopularMovies(using navigationController: UINavigationController?, context: Context) -> PopularMoviesViewController {
        let router = PopularMoviesRouter()
        let interactor = PopularMoviesInteractor()
        let presenter = PopularMoviesPresenter(interactor: interactor, router: router)
        let view = PopularMoviesViewController()
        let worker = PopularMoviesWorker(context.network)
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        interactor.worker = worker
        router.navigationController = navigationController
        router.viewController = view

        return view
    }
}
