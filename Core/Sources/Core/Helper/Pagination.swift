//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public class PaginationManager {
    public var currentPage: Int = 1
    public var increase: Int = 1
    public var totalPage: Int = .zero

    public init() {}
    
    public func nextPage() {
        currentPage += increase
    }

    public func resetOptions() {
        totalPage = .zero
        currentPage = 1
    }
}
