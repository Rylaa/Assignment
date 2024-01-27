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
    private var isLoading = false
    private var cancellables = CancelBag()
}

extension PopularMoviesInteractor: PopularMoviesInteractorProtocol {
    @MainActor
    func fetchPopularMovies() {
        guard
            !isLoading,
            (response?.page).toIntValueOrZero < (response?.totalPages ?? 1) else {
            return
        }

        isLoading = true

        let page = (response?.page).toIntValueOrZero + 1
        worker?.fetchPopularMoviesWithPage(page)
            .sink(receiveCompletion: { [weak self] requestState in
                guard let self else { return }
                switch requestState {
                case .finished:
                    Log.debug("\(#function) request succeeded")
                case let .failure(error):
                    Log.debug("\(#function) Request failed with error: \(error)")
                }

                self.isLoading = false
            }, receiveValue: { [weak self] response in
                guard let self, let results = response.results else { return }

                self.response = response
                self.provideCollectionViewSections(results)
                self.isLoading = false
            })
            .store(in: cancellables)
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
