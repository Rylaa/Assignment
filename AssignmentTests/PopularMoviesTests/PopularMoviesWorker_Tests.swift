//
//  PopularMoviesWorker_Tests.swift
//  -AssignmentTests
//
//  Created by Yusuf Demirkoparan on 28.01.2024.
//
// swiftlint:disable all

import Combine
import Core
import Network
@testable import Assignment
import XCTest

class DashboardWorkerTests: XCTestCase {
    var sut: PopularMoviesWorker!
    var mockService: MockNetworkClientService!
    var cancellables = CancelBag()

    override func setUp() {
        super.setUp()
        mockService = MockNetworkClientService()
        sut = PopularMoviesWorker(mockService)
        cancellables = CancelBag()
    }

    override func tearDown() {
        sut = nil
        mockService = nil
        cancellables = CancelBag()
        super.tearDown()
    }

    func testFetchCards_Success() {
        mockService.mockResponse = MockData.popularMoviesResponse

        sut.fetchPopularMoviesWithPage(1)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    XCTFail("Expected success but got \(error)")
                case .finished:
                  break
                }
            }, receiveValue: { response in
                XCTAssertEqual(response.page, 1)
            })
            .store(in: cancellables)
    }

    func testFetchCards_Error() {
        let mockError = RequestError.connectionLost
        mockService.mockError = mockError

        sut.fetchPopularMoviesWithPage(1)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertNotNil(error)
                case .finished:
                  break
                }
            }, receiveValue: { response in
                XCTFail("Expected error but got success")
            })
            .store(in: cancellables)
    }
}

class MockNetworkClientService: NetworkClientService {
    var urlSession: URLSession?
    var subscribeQueue: DispatchQueue = .main
    var mockResponse: PopularMoviesResponseModel?
    var mockError: RequestError?

    func request<T>(_ request: Request, response: T.Type) -> AnyPublisher<T, RequestError> where T: Decodable {
        if let error = mockError {
            return Fail(error: error).eraseToAnyPublisher()
        }

        guard let response = mockResponse as? T else {
            fatalError("Mock response is not of type \(T.self)")
        }

        return Just(response)
            .setFailureType(to: RequestError.self)
            .eraseToAnyPublisher()
    }
}
