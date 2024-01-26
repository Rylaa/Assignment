//
//  FavoreMoviesCollectionViewCell.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Core
import SnapKit
import UIKit

final class PopularMoviesCollectionViewCell: UICollectionViewCell, Providable {
    typealias ProvidedItem = FavoriteMoviesDetailModel

    private let bannerView = MovieBannerView()
    private var cellModel: ProvidedItem?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func provide(_ item: FavoriteMoviesDetailModel) {
        cellModel = item
        bannerView.provideModel(item)
    }
}

private extension PopularMoviesCollectionViewCell {
    func commonInit() {
        setupViews()
    }

    func setupViews() {
        addBannerView()
    }

    func addBannerView() {
        contentView.addSubview(bannerView)
        bannerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
