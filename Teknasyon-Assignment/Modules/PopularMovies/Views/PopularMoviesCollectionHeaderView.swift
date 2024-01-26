//
//  PopularMoviesCollectionHeaderView.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit
import SnapKit
import Core

struct PopularMoviesCollectionHeaderModel: Hashable {
    var title: String?
}

final class PopularMoviesCollectionHeaderView: UICollectionReusableView, Providable {
   
    let titleLabel = UILabel()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func provide(_ item: PopularMoviesCollectionHeaderModel) {
        titleLabel.text = item.title
    }
}

extension PopularMoviesCollectionHeaderView {
    func setupViews() {
        addSubview(titleLabel)
        titleLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .white
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
