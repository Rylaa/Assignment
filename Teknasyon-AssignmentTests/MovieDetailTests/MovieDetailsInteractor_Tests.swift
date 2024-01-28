//
//  MovieDetailsInteractor_Tests.swift
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

class MoviesDetailInteractorTests: XCTestCase {

    var interactor: MoviesDetailInteractor!
    var mockPresenter: MockMoviesDetailPresenter!
    var testMovieDetail: MovieModel!

    override func setUp() {
        super.setUp()
        testMovieDetail = MovieModel(id: 1, posterPath: "/testPath", title: "Test Movie", overview: "Test Overview")
        mockPresenter = MockMoviesDetailPresenter()
        interactor = MoviesDetailInteractor(testMovieDetail)
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        testMovieDetail = nil
        super.tearDown()
    }

    func testInteractorInitialization() {
        XCTAssertNotNil(interactor)
        XCTAssertEqual(interactor.movieDetail.id, testMovieDetail.id)
        XCTAssertEqual(interactor.movieDetail.posterPath, testMovieDetail.posterPath)
        XCTAssertEqual(interactor.movieDetail.title, testMovieDetail.title)
        XCTAssertEqual(interactor.movieDetail.overview, testMovieDetail.overview)
    }
    
    class MockMoviesDetailPresenter: MoviesDetailPresenterProtocol {
        var view: MoviesDetailViewProtocol?
        var isInitializeCalled = false
      
        func initialize() {
            isInitializeCalled = true
        }
    }
}
