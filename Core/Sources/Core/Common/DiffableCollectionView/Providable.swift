//
//  File 2.swift
//  
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public protocol Providable: Hashable {
    associatedtype ProvidedItem: Hashable
    
    func provide(_ item: ProvidedItem)
}
