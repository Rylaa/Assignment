//
//  PopularMoviesWorker.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//
import Combine
import Network

protocol PopularMoviesWorkerProtocol: AnyObject {
    func fetchPopularMoviesWithPage(_ page: Int) -> AnyPublisher<PopularMoviesResponseModel, RequestError>
}

final class PopularMoviesWorker: PopularMoviesWorkerProtocol {
    private let service: NetworkClientService

    init(_ service: NetworkClientService) {
        self.service = service
    }

    func fetchPopularMoviesWithPage(_ page: Int) -> AnyPublisher<PopularMoviesResponseModel, RequestError> {
        service.request(getRequest(page), response: PopularMoviesResponseModel.self).eraseToAnyPublisher()
    }

    func getRequest(_ page: Int) -> Request {
        RequestBuilder(.popular)
            .method(.get)
            .parameters(["page": page])
            .build()
    }
}
