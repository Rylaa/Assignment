//
//  FavoriteMoviesRouter.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit

protocol PopularMoviesRouterProtocol: AnyObject {
//    func showDetail(_ item:)
}

final class PopularMoviesRouter: PopularMoviesRouterProtocol {
    
    var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    private var context: Context?
//    func showDetail(_ item:) {
//        guard let context else { return }
//    
//    }
}

extension PopularMoviesRouter {
    static func buildFavoriteMovies(using navigationController: UINavigationController?, context: Context) -> PopularMoviesViewController {
        let router = PopularMoviesRouter()
        let interactor = PopularMoviesInteractor()
        let presenter = FavoriteMoviesPresenter(interactor: interactor, router: router)
        let view = PopularMoviesViewController()
        let worker = FavoriteMoviesWorker(context.network)
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        interactor.worker = worker
        router.navigationController = navigationController
        router.viewController = view
        
        return view
    }
}
