//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit

public extension UICollectionViewLayout {
    static func createFlowLayout(itemSize: CGSize = .zero,
                                 minimumLineSpacing: CGFloat = 0,
                                 minimumInteritemSpacing: CGFloat = 0,
                                 sectionInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                 scrollDirection: UICollectionView.ScrollDirection = .vertical) -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = itemSize
        flowLayout.minimumLineSpacing = minimumLineSpacing
        flowLayout.minimumInteritemSpacing = minimumInteritemSpacing
        flowLayout.sectionInset = sectionInset
        flowLayout.scrollDirection = scrollDirection

        return flowLayout
    }
}
