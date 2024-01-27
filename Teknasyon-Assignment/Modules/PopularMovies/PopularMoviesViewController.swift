//
//  PopularMoviesViewController.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Core
import SnapKit
import UIKit

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
            make.edges.equalToSuperview()
        }

        let collectionViewDataSource = PopularMoviesCollectionViewDatasource(collectionView: collectionView,
                                                                             cellReuseIdentifier: PopularMoviesCollectionViewCell.identifier,
                                                                             headerIdentifier: PopularMoviesCollectionHeaderView.identifier)
        collectionView.dataSource = collectionViewDataSource.makeDataSource()
        collectionView.delegate = collectionViewDataSource
        collectionView.backgroundColor = .black
        collectionView.isPagingEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.setContentOffset(CGPoint.zero, animated: false)
        collectionView.register(PopularMoviesCollectionViewCell.self, forCellWithReuseIdentifier: PopularMoviesCollectionViewCell.identifier)
        collectionView.register(PopularMoviesCollectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: PopularMoviesCollectionHeaderView.identifier)
        presenter.collectionViewDataSource(collectionViewDataSource)
    }
}
