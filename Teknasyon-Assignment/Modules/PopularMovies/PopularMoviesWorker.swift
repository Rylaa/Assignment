//
//  FavoriteMoviesWorker.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//
import Combine
import Network

protocol FavoriteMoviesWorkerProtocol: AnyObject {
    func fetchFavoriteMovies() -> AnyPublisher<FavoriteMoviesResponseModel, RequestError>
}

final class PopularMoviesWorker: FavoriteMoviesWorkerProtocol {
    private let service: NetworkClientService

    init(_ service: NetworkClientService) {
        self.service = service
    }

    func fetchFavoriteMovies() -> AnyPublisher<FavoriteMoviesResponseModel, RequestError> {
        service.request(getRequest(), response: FavoriteMoviesResponseModel.self).eraseToAnyPublisher()
    }

    func getRequest() -> Request {
        RequestBuilder(.favorite)
            .method(.get)
//            .parameters(["account_id": "gte99"])
            .build()
    }
}
