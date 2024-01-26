//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//
// swiftlint:disable all
import UIKit

open class CollectionViewModel<CellType: UICollectionViewCell & Providable, HeaderType: UICollectionReusableView & Providable>: NSObject {
    // Typealiases for our convenience
    public typealias Item = CellType.ProvidedItem
    public typealias HeaderItem = HeaderType.ProvidedItem?
    public typealias DataSource = UICollectionViewDiffableDataSource<Section<HeaderItem, [Item]>, Item>?

    public weak var collectionView: UICollectionView?

    public var sections: Binding<[Section<HeaderItem, [Item]>]> = .init([])
    private var dataSource: DataSource?
    private var headerIdentifier: String? = ""
    private var cellIdentifier: String

    public init(collectionView: UICollectionView, cellReuseIdentifier: String, headerIdentifier: String? = "") {
        cellIdentifier = cellReuseIdentifier
        self.collectionView = collectionView
        self.headerIdentifier = headerIdentifier
        super.init()
    }

    private func update() {
        var snapshot = NSDiffableDataSourceSnapshot<Section<HeaderItem, [Item]>, Item>()

        sections.value.forEach { section in
            snapshot.appendSections([section])
            snapshot.appendItems(section.items)
        }
        
        dataSource!?.apply(snapshot, animatingDifferences: true)
    }

    public func add(_ sections: [Section<HeaderItem, [Item]>]) {
        sections.forEach { section in
            self.sections.value.append(section)
        }

        update()
    }

    public func remove(_ sections: [Section<HeaderItem, [Item]>]) {
        sections.forEach { section in
            self.sections.value.removeAll { $0 == section }
        }

        update()
    }

    public func update(_ sections: [Section<HeaderItem, [Item]>]) {
        self.sections.value.removeAll()

        sections.forEach { section in
            self.sections.value.append(section)
        }

        update()
    }

    public func replace(_ replacedItem: Item) {
        for (sectionIndex, section) in sections.value.enumerated() {
            for (itemIndex, item) in section.items.enumerated() {
                if replacedItem == item {
                    sections.value[sectionIndex].items[itemIndex] = replacedItem

                    break
                }
            }
        }

        update()
    }
}

extension CollectionViewModel {
    private func cellProvider(_ collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CellType {
            cell.provide(item)

            return cell
        }

        return UICollectionViewCell()
    }

    public func makeDataSource() -> DataSource {
        guard let collectionView = collectionView else { fatalError() }
        
        let dataSource = UICollectionViewDiffableDataSource<Section<HeaderItem,
                                                                    [CellType.ProvidedItem]>,
                                                                CellType.ProvidedItem>(collectionView: collectionView, cellProvider: cellProvider)

        dataSource.supplementaryViewProvider = { [self] (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in

            if let header: HeaderType = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                        withReuseIdentifier: headerIdentifier.toStringValueOrEmpty,
                                                                                        for: indexPath) as? HeaderType,
               let item = sections.value[indexPath.section].headerItem,
               let headerItem: HeaderType.ProvidedItem = item {
                header.provide(headerItem)

                return header
            }

            return UICollectionReusableView()
        }

        self.dataSource = dataSource

        return dataSource
    }
}
