//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public class PaginationManager {
    var currentPage: Int = 1
    var increase: Int = 1
    var totalPage: Int = .zero

    public init() {}

    public func configure(currentPage: Int = .zero, totalPage: Int = .zero) {
        self.currentPage = currentPage
        self.totalPage = totalPage
    }

    public func nextPage() {
        currentPage += increase
    }

    public func resetOptions() {
        totalPage = .zero
        currentPage = 1
    }
}
