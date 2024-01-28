//
//  MovieDetailsPresenter_Tests.swift
//  Teknasyon-AssignmentTests
//
//  Created by Yusuf Demirkoparan on 28.01.2024.
//

// swiftlint:disable all
import Combine
import Core
import Network
@testable import Teknasyon_Assignment
import XCTest

class MoviesDetailPresenter_Tests: XCTestCase {
    var presenter: MoviesDetailPresenter!
    var mockView: MockMoviesDetailView!
    var mockInteractor: MockMoviesDetailInteractor!
    var mockRouter: MockMoviesDetailRouter!

    override func setUp() {
        super.setUp()
        mockView = MockMoviesDetailView()
        mockInteractor = MockMoviesDetailInteractor()
        mockRouter = MockMoviesDetailRouter()
        presenter = MoviesDetailPresenter(interactor: mockInteractor, router: mockRouter)
        presenter.view = mockView
    }

    override func tearDown() {
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        presenter = nil
        super.tearDown()
    }

    func testInitialize() {
        presenter.initialize()
        XCTAssertTrue(mockView.isProvideMovieDetailsCalled)
    }

    class MockMoviesDetailView: MoviesDetailViewProtocol {
        var isInitializeCalled = false
        var providedMovieDetails: MovieModel?

        func initialize() {
            isInitializeCalled = true
        }

        func provideMovieDetails(_ details: MovieModel) {
            providedMovieDetails = details
            isProvideMovieDetailsCalled = true
        }

        var isProvideMovieDetailsCalled = false
    }

    class MockMoviesDetailInteractor: MoviesDetailInteractorProtocol {
        weak var presenter: MoviesDetailPresenterProtocol?
        var movieDetailGetterCalled: Bool = false
        private var movieDetailStored: MovieModel

        init(movieDetail: MovieModel = MovieModel(id: 1, posterPath: "mock/path", title: "Mock Movie", overview: "Mock overview")) {
            movieDetailStored = movieDetail
        }

        var movieDetail: MovieModel {
            get {
                movieDetailGetterCalled = true
                return movieDetailStored
            }
            set {
                movieDetailStored = newValue
            }
        }
    }

    class MockMoviesDetailRouter: MoviesDetailRouterProtocol {
        var navigationController: UINavigationController?
        weak var viewController: UIViewController?
        var isNavigationCalled = false
        var navigatedToViewControllerType: AnyClass?
        func navigateToSomeViewController() {
            isNavigationCalled = true
            navigatedToViewControllerType = MoviesDetailViewController.self
        }
    }
}
