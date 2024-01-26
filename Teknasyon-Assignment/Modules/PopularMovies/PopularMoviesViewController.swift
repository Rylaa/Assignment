//
//  FavoriteMoviesViewController.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import SnapKit
import UIKit
import Core

protocol FavoriteMoviesViewProtocol: AnyObject {
    func initialize()
}

final class PopularMoviesViewController: UIViewController {
    var presenter: FavoriteMoviesPresenterProtocol! /// We force unwrap because we know it will always be non-nil (or always be strong).
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: .createFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initialize()
    }
}

// MARK: Presenter contracts
extension PopularMoviesViewController: FavoriteMoviesViewProtocol {
    func initialize() {
        presenter.initialize()
    }
}

private extension PopularMoviesViewController {
    func setupViews() {
      addCollectionViewToView()
    }
    
    func addCollectionViewToView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.height.equalTo(30)
            make.leading.trailing.equalToSuperview()
        }
        
        let collectionViewDataSource = FavoriteMoviesCollectionViewDatasource(collectionView: collectionView,
                                                                              cellReuseIdentifier: FavoriteMoviesCollectionViewCell.identifier)
        collectionView.dataSource = collectionViewDataSource.makeDataSource()
        collectionView.delegate = collectionViewDataSource
        collectionView.backgroundColor = .black
        collectionView.isPagingEnabled = false
        collectionView.register(FavoriteMoviesCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteMoviesCollectionViewCell.identifier)
        presenter.collectionViewDataSource(collectionViewDataSource)
    }
}
