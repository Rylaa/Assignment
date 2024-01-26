//
//  PopularMoviesViewController.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import SnapKit
import UIKit
import Core

protocol PopularMoviesViewProtocol: AnyObject {
    func initialize()
}

final class PopularMoviesViewController: UIViewController {
    var presenter: PopularMoviesPresenterProtocol! /// We force unwrap because we know it will always be non-nil (or always be strong).
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: .createFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initialize()
    }
}

// MARK: Presenter contracts
extension PopularMoviesViewController: PopularMoviesViewProtocol {
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
        
        let collectionViewDataSource = PopularMoviesCollectionViewDatasource(collectionView: collectionView,
                                                                              cellReuseIdentifier: PopularMoviesCollectionViewCell.identifier)
        collectionView.dataSource = collectionViewDataSource.makeDataSource()
        collectionView.delegate = collectionViewDataSource
        collectionView.backgroundColor = .black
        collectionView.isPagingEnabled = false
        collectionView.register(PopularMoviesCollectionViewCell.self, forCellWithReuseIdentifier: PopularMoviesCollectionViewCell.identifier)
        presenter.collectionViewDataSource(collectionViewDataSource)
    }
}
