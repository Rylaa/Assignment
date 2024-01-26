//
//  PopularMoviesCollectionViewDatasource.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Core
import UIKit

protocol PopularMoviesViewDatasourceProtocol: AnyObject {
    func didSelectItem(_ selectedItem: URL)
}

final class PopularMoviesCollectionViewDatasource: CollectionViewModel<PopularMoviesCollectionViewCell, PopularMoviesCollectionHeaderView> {
    weak var delegate: PopularMoviesViewDatasourceProtocol?

    override init(collectionView: UICollectionView, cellReuseIdentifier: String, headerIdentifier: String? = "") {
        super.init(collectionView: collectionView, cellReuseIdentifier: cellReuseIdentifier, headerIdentifier: headerIdentifier)
    }
}

extension PopularMoviesCollectionViewDatasource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: (UIScreen.current?.bounds.width).toCGFloatValueOrZero, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (UIScreen.current?.bounds.width).toCGFloatValueOrZero / 2

        return CGSize(width: itemSize, height: itemSize)
    }
}

extension PopularMoviesCollectionViewDatasource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let selectedItem = sections.value[safe: indexPath.section]?.items[safe: indexPath.row] {
//            delegate?.didSelectItem(selectedItem)
//        }
    }
}
