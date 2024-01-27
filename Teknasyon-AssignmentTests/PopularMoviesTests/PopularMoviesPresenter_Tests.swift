//
//  PopularMoviesPresenter_Tests.swift
//  Teknasyon-AssignmentTests
//
//  Created by Yusuf Demirkoparan on 27.01.2024.
//
// swiftlint:disable all
import Combine
import Core
import Foundation
import Network
@testable import Teknasyon_Assignment
import XCTest

class PopularMoviesPresenterTests: XCTestCase {
    var presenter: PopularMoviesPresenter!
    var mockView: MockPopularMoviesView!
    var mockInteractor: MockPopularMoviesInteractor!
    var mockRouter: MockPopularMoviesRouter!

    override func setUp() {
        super.setUp()
        mockView = MockPopularMoviesView()
        mockInteractor = MockPopularMoviesInteractor()
        mockRouter = MockPopularMoviesRouter()
        presenter = PopularMoviesPresenter(interactor: mockInteractor, router: mockRouter)
        presenter.view = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }

    func testInitializeTriggersFetchPopularMovies() {
        let mockInteractor = MockPopularMoviesInteractor()
        let presenter = PopularMoviesPresenter(interactor: mockInteractor, router: mockRouter)
        presenter.view = mockView

        presenter.initialize()

        XCTAssertTrue(mockInteractor.isFetchPopularMoviesCalled)
    }

    func testAddCollectionViewSections() {
        var mockSections = [Section<PopularMoviesCollectionHeaderModel?, [MovieModel]>]()
        mockSections.append(Section(items: [MovieModel(id: 1, posterPath: "mock/path", title: "Mock Movie", overview: "Mock overview")]))

        mockView.addCollectionViewSections(mockSections)
        XCTAssertTrue((mockView.collectionViewSectionsAdded?.count ?? 0) > 0)
    }
}

class MockPopularMoviesView: PopularMoviesViewProtocol {
    var isInitializeCalled = false
    var collectionViewSectionsAdded: [Section<PopularMoviesCollectionHeaderModel?, [MovieModel]>]?

    func initialize() {
        isInitializeCalled = true
    }

    func addCollectionViewSections(_ sections: [Section<PopularMoviesCollectionHeaderModel?, [MovieModel]>]) {
        collectionViewSectionsAdded = sections
    }
}

class MockPopularMoviesInteractor: PopularMoviesInteractorProtocol {
    var presenter: PopularMoviesPresenterProtocol?
    var isFetchPopularMoviesCalled = false

    func fetchPopularMovies() {
        isFetchPopularMoviesCalled = true
    }
}

class MockPopularMoviesRouter: PopularMoviesRouterProtocol {
    func showDetail(_ movieDetail: Teknasyon_Assignment.MovieModel) {}
    
    var isSomeNavigationCalled = false

    func navigateToSomeScreen() {
        isSomeNavigationCalled = true
    }
}
