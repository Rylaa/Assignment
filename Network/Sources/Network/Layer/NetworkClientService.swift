//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Combine
import Core
import Foundation

public protocol NetworkClientService {
    func request<T: Decodable>(_ request: Request, response: T.Type) -> AnyPublisher<T, RequestError>
}

public final class NetworkClient: NetworkClientService {
    private var subscribeQueue = DispatchQueue(label: "com.Teknasyon.queue", qos: .background)
    private var urlSession: URLSession?

    public init() {}

    public func initializeSessionManagers() {
        urlSession?.invalidateAndCancel()
        urlSession = URLSession(configuration: .default, delegate: URLSessionPinningDelegate(), delegateQueue: nil)
    }

    public func request<T: Decodable>(_ request: Request, response: T.Type) -> AnyPublisher<T, RequestError> {
        guard let urlRequest = request.setUrlRequest(isRunningInBackground: true) else {
            return Fail(error: RequestError.incorrectDataReturned).eraseToAnyPublisher()
        }

        guard let urlSession = urlSession else {
            return Fail(error: RequestError.noRequest).eraseToAnyPublisher()
        }

        Spinner.start()

        return urlSession.dataTaskPublisher(for: urlRequest)
            .mapError { error in
                RequestError.misFunctionedUrl(error)
            }
            .flatMap { data, response -> AnyPublisher<T, RequestError> in
                data.prettyPrinted()
                Spinner.stop()

                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: RequestError.incorrectDataReturned).eraseToAnyPublisher()
                }

                guard (200 ... 299).contains(httpResponse.statusCode) else {
                    return Fail(error: RequestError.invalidStatusCode(httpResponse.statusCode)).eraseToAnyPublisher()
                }

                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    return Just(decodedData)
                        .setFailureType(to: RequestError.self)
                        .eraseToAnyPublisher()
                } catch {
                    return Fail(error: RequestError.parsingError(error)).eraseToAnyPublisher()
                }
            }
            .retry(request.retryCount)
            .delay(for: .seconds(request.retryDelay), scheduler: subscribeQueue)
            .eraseToAnyPublisher()
    }
}
