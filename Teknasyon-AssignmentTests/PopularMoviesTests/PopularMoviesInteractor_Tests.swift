//
//  PopularMovies_Tests.swift
//  Teknasyon-AssignmentTests
//
//  Created by Yusuf Demirkoparan on 27.01.2024.
//
// swiftlint:disable all
import Combine
import Core
import Network
@testable import Teknasyon_Assignment
import XCTest

class PopularMoviesInteractorTests: XCTestCase {
    var interactor: PopularMoviesInteractor!
    var mockWorker: MockPopularMoviesWorker!
    var mockPresenter: MockPopularMoviesPresenter!

    override func setUp() {
        super.setUp()
        mockWorker = MockPopularMoviesWorker()
        mockPresenter = MockPopularMoviesPresenter()
        interactor = PopularMoviesInteractor()
        interactor.worker = mockWorker
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockWorker = nil
        mockPresenter = nil
        super.tearDown()
    }

    @MainActor func testFetchPopularMovies_Success() {
        mockWorker.mockResult = .success(MockData.popularMoviesResponse)
        let expectation = self.expectation(description: "Fetch movies success")

        interactor.fetchPopularMovies()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.mockPresenter.isAddCollectionViewSectionsCalled)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }
}

class MockPopularMoviesWorker: PopularMoviesWorkerProtocol {
    var mockResult: Result<PopularMoviesResponseModel, Error>?

    func fetchPopularMoviesWithPage(_ page: Int) -> AnyPublisher<PopularMoviesResponseModel, RequestError> {
        return Future<PopularMoviesResponseModel, RequestError> { promise in
            if let result = self.mockResult {
                switch result {
                case let .success(response):
                    promise(.success(response))
                case let .failure(error):
                    promise(.failure(error as! RequestError))
                }
            }
        }.eraseToAnyPublisher()
    }
}

class MockPopularMoviesPresenter: PopularMoviesPresenterProtocol {
    var view: PopularMoviesViewProtocol?
    var isInitializeCalled = false
    var isAddCollectionViewSectionsCalled = false
    var collectionViewSections: [Section<PopularMoviesCollectionHeaderModel?, [MovieModel]>]?

    func initialize() {
        isInitializeCalled = true
    }

    func collectionViewDataSource(_ dataSource: PopularMoviesCollectionViewDatasource) {}

    func addCollectionViewSections(_ sections: [Section<PopularMoviesCollectionHeaderModel?, [MovieModel]>]) {
        isAddCollectionViewSectionsCalled = true
        collectionViewSections = sections
    }
}

struct MockData {
    static let popularMoviesResponse: PopularMoviesResponseModel = {
        let mockMovie = MovieModel(id: 1, posterPath: "mock/path", title: "Mock Movie", overview: "Mock overview")
        let movideDetail = PopularMoviesDetailModel(movies: [mockMovie])
        return PopularMoviesResponseModel(results: [movideDetail], totalPages: 10, page: 1)
    }()
}
