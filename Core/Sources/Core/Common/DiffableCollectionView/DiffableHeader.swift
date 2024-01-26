//
//  File.swift
//  
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit
// swiftlint:disable all
public class SupplementaryView: UICollectionReusableView, Providable {
    public func provide(_ item: Header) {}
    
    public typealias ProvidedItem = Header
}

public struct Header: Hashable {
    public init(titleHeader: String) {
        self.titleHeader = titleHeader
    }
    
    public let titleHeader: String
}
