//
//  MovieBannerView.swift
//  -Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import SnapKit
import UIKit

final class MovieBannerView: UIView {
    enum BannerType {
        case detail
        case popular
    }
    
    private let contentStackView = UIStackView()
    private let bannerImageView = UIImageView()
    private let bottomStackView = UIStackView()
    private let voteDetailLabel = UILabel()
    private let moviewNameLabel = UILabel()
    private var model: MovieBannerConformableProtocol?

    enum Constants {
        static let bottomStackViewHeight: CGFloat = 56
        static let size8: CGFloat = 8
    }

    required init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }

    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func provideModel(_ model: MovieBannerConformableProtocol, type: BannerType) {
        self.model = model

        bannerImageView.load(imageUrl: model.bannerUrl)
        moviewNameLabel.text = type == .popular ? model.movieName : model.movieDetail
        voteDetailLabel.text = "IMDB \(model.averageOfVote)"
    }
}

private extension MovieBannerView {
    func setupViews() {
        addContentStackView()
        addBannerImageView()
        addBottomStackView()
        addMovieNameLabel()
        addVoteDetailLabel()
    }

    func addContentStackView() {
        contentStackView.distribution = .fill
        contentStackView.alignment = .fill
        contentStackView.axis = .vertical

        addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func addBannerImageView() {
        bannerImageView.contentMode = .scaleAspectFit
        contentStackView.addArrangedSubview(bannerImageView)
    }

    func addBottomStackView() {
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = Constants.size8
        
        contentStackView.addArrangedSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.height.equalTo(Constants.bottomStackViewHeight)
        }
    }

    func addMovieNameLabel() {
        moviewNameLabel.textColor = .white
        moviewNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        moviewNameLabel.numberOfLines = 2
        bottomStackView.addArrangedSubview(moviewNameLabel)
    }

    func addVoteDetailLabel() {
        voteDetailLabel.textColor = .white
        voteDetailLabel.font = .systemFont(ofSize: 16, weight: .medium)
        bottomStackView.addArrangedSubview(voteDetailLabel)
    }
}
