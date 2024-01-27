//
//  SceneDelegate.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var container: DependencyContainer!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        container = DependencyContainer()

        let navigationController = UINavigationController()
        let builPopularMovies = PopularMoviesRouter.buildPopularMovies(using: navigationController, context: container)
        navigationController.pushViewController(builPopularMovies, animated: true)
        let window = UIWindow(windowScene: windowScene)
        window.tintColor = .white
        window.overrideUserInterfaceStyle = .dark
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
