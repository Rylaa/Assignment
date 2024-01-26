//
//  PopularMoviesInteractor.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation
import Core
import Combine

protocol PopularMoviesInteractorProtocol {
    var presenter: PopularMoviesPresenterProtocol? { get }
  
    func fetchPopularMovies()
}

final class PopularMoviesInteractor {
    weak var presenter: PopularMoviesPresenterProtocol?
    var worker: PopularMoviesWorkerProtocol?
    
    private var cancellables = CancelBag()
}

extension PopularMoviesInteractor: PopularMoviesInteractorProtocol {
    
    @MainActor
    func fetchPopularMovies() {
        worker?.fetchPopularMovies().sink(receiveCompletion: { [weak self] requestState in
            guard let self else { return }
            
            switch requestState {
            case .finished:
                Log.debug("\(#function) request succeeded")
            case .failure(let error):
                Log.debug("Request failed with error: \(error)")
            }
        }, receiveValue: { [weak self] response in
            guard let self else { return }
            
        }).store(in: cancellables)
    }
}
