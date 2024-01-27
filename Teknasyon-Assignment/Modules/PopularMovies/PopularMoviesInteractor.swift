//
//  PopularMoviesInteractor.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Combine
import Core
import Foundation

protocol PopularMoviesInteractorProtocol {
    var presenter: PopularMoviesPresenterProtocol? { get }

    func fetchPopularMovies()
}

final class PopularMoviesInteractor {
    weak var presenter: PopularMoviesPresenterProtocol?
    var worker: PopularMoviesWorkerProtocol?
    private var response: PopularMoviesResponseModel?
    private var paginationManager = PaginationManager()
    private var cancellables = CancelBag()
}

extension PopularMoviesInteractor: PopularMoviesInteractorProtocol {
    @MainActor
    func fetchPopularMovies() {
        worker?.fetchPopularMoviesWithPage(paginationManager.currentPage)
            .sink(receiveCompletion: { [weak self] requestState in
                guard let self else { return }

                switch requestState {
                case .finished:
                    Log.debug("\(#function) request succeeded")
                case let .failure(error):
                    Log.debug("\(#function) Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                guard let self, let results = response.results else { return }
                
                self.response = response
                self.updatePaginationManager()
                self.provideCollectionViewSections(results)
            })
            .store(in: cancellables)
    }
    
    func updatePaginationManager() {
        paginationManager.nextPage()
        
        if paginationManager.totalPage == .zero {
            paginationManager.totalPage = (response?.totalPages).toIntValueOrZero
        }
    }
    
    func provideCollectionViewSections(_ sections: [PopularMoviesDetailModel]) {
        let sections = sections.compactMap { section -> Section<PopularMoviesCollectionHeaderModel?, [MovieModel]>? in
            guard let movies = section.movies else {
                return nil
            }
            
            return Section(headerItem: PopularMoviesCollectionHeaderModel(title: section.name), items: movies)
        }
        
        presenter?.addCollectionViewSections(sections)
    }
}
