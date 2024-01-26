//
//  File 2.swift
//  
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public struct Section<U: Hashable, T: Hashable>: Hashable {
    public init(headerItem: U? = nil, items: T) {
        self.headerItem = headerItem
        self.items = items
    }
    
    public let headerItem: U?
    public var items: T
}
