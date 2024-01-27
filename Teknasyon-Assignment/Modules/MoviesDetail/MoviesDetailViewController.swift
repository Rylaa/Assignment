//
//  MoviesDetailViewController.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 27.01.2024.
//

import Core
import SnapKit
import UIKit

protocol MoviesDetailViewProtocol: AnyObject {
    func initialize()
    func provideMovieDetails(_ details: MovieModel)
}

final class MoviesDetailViewController: UIViewController {
    private let bannerView = MovieBannerView()
    var presenter: MoviesDetailPresenterProtocol! /// We force unwrap because we know it will always be non-nil (or always be strong).

    enum Constants {
        static let padding32: CGFloat = 32
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initialize()
    }
}

extension MoviesDetailViewController: MoviesDetailViewProtocol {
    func initialize() {
        presenter.initialize()
    }
    
    func provideMovieDetails(_ details: MovieModel) {
        bannerView.provideModel(details, type: .detail)
    }
}

private extension MoviesDetailViewController {
    func commonInit() {
        view.backgroundColor = .black
        setupViews()
    }

    func setupViews() {
        addBannerView()
    }

    func addBannerView() {
        view.addSubview(bannerView)
        bannerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.padding32)
        }
    }
}
