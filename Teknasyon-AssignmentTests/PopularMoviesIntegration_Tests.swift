//
//  PopularMoviesIntegration_Tests.swift
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

class PopularMoviesIntegration_Tests: XCTestCase {
    
    private var networkProtocol: NetworkClientService!
    private var cancellables = CancelBag()
    
    override func setUp() {
        let configUrlSession = URLSessionConfiguration.ephemeral
        configUrlSession.protocolClasses = [SimuleURLSession.self]
        let session = URLSession(configuration: configUrlSession)
        networkProtocol = NetworkClient(subscribeQueue: .main, session)
    }
    
    
    func test_HappyPath_Response() throws {
        let expect = expectation(description: "result happy path")
        let api = DependencyContainer()
        api.network = networkProtocol as! NetworkClient
       
        let mockJSON = try ResourceLoader.loadFile()
        SimuleURLSession.stubResponseData = mockJSON
        
        api.network.request(getRequest(1), response: PopularMoviesResponseModel.self)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: {  requestState in
                XCTFail()
            }, receiveValue: { response in
                XCTAssertTrue((response.results?.count ?? 0) > 0)
                expect.fulfill()
            })
        .store(in: cancellables)

        expect.fulfill()
        wait(for: [expect], timeout: 15)
    }
    
    func test_Error_Response() throws {
        let expect = expectation(description: "result happy path")
        let api = DependencyContainer()
        api.network = networkProtocol as! NetworkClient
        
        SimuleURLSession.stubError = RequestError.invalidStatusCode(500)
        
        api.network.request(getRequest(1), response: PopularMoviesResponseModel.self)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: {  requestState in
                XCTFail()
            }, receiveValue: { response in
                XCTAssertTrue((response.results?.count ?? 0) > 0)
                expect.fulfill()
            })
        .store(in: cancellables)

        expect.fulfill()
        wait(for: [expect], timeout: 10)
    }
    
    func getRequest(_ page: Int) -> Request {
        RequestBuilder(.popular)
            .method(.get)
            .parameters(["page": page])
            .build()
    }
}
