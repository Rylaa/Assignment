//
//  PopularMoviesWorker.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//
import Combine
import Network

protocol PopularMoviesWorkerProtocol: AnyObject {
    func fetchPopularMovies() -> AnyPublisher<PopularMoviesResponseModel, RequestError>
}

final class PopularMoviesWorker: PopularMoviesWorkerProtocol {
    private let service: NetworkClientService

    init(_ service: NetworkClientService) {
        self.service = service
    }

    func fetchPopularMovies() -> AnyPublisher<PopularMoviesResponseModel, RequestError> {
        service.request(getRequest(), response: PopularMoviesResponseModel.self).eraseToAnyPublisher()
    }

    func getRequest() -> Request {
        RequestBuilder(.popular)
            .method(.get)
            .build()
    }
}
