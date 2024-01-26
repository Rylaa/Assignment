//
//  File.swift
//  
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public extension CGRect {
    var minEdge: CGFloat {
        min(width, height)
    }
}
