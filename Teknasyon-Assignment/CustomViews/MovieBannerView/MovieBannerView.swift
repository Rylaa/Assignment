//
//  MovieBannerView.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import SnapKit
import UIKit

final class MovieBannerView: UIView {
    private let contentStackView = UIStackView()
    private let bannerImageView = UIImageView()
    private let bottomStackView = UIStackView()
    private let voteDetailLabel = UILabel()
    private let moviewNameLabel = UILabel()
    private var model: MovieBannerConformableProtocol?

    enum Constants {
        static let bottomStackViewHeight: CGFloat = 56
    }

    required init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func provideModel(_ model: MovieBannerConformableProtocol) {
        self.model = model

        bannerImageView.load(imageUrl: model.bannerUrl)
        moviewNameLabel.text = model.movieName
        voteDetailLabel.text = "\(model.vote) / \(model.averageOfVote)"
    }
}

private extension MovieBannerView {
    func setupViews() {
        addContentStackView()
        addBannerImageView()
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
        bannerImageView.contentMode = .scaleAspectFill
        contentStackView.addArrangedSubview(bannerImageView)
    }

    func addBottomStackView() {
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually

        contentStackView.addArrangedSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.height.equalTo(Constants.bottomStackViewHeight)
        }
    }

    func addMovieNameLabel() {
        moviewNameLabel.textColor = .white
        moviewNameLabel.font = .systemFont(ofSize: 16, weight: .medium)

        bottomStackView.addArrangedSubview(moviewNameLabel)
    }

    func addVoteDetailLabel() {
        voteDetailLabel.textColor = .white
        voteDetailLabel.font = .systemFont(ofSize: 16, weight: .medium)
        bottomStackView.addArrangedSubview(voteDetailLabel)
    }
}
