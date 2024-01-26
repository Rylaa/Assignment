//
//  File.swift
//  
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public class Binding<T> {
    public typealias Handler = (T) -> Void
    
    public var value: T {
        didSet {
            handler?(value)
        }
    }
    
    private var handler: Handler?
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(_ handler: Handler?) {
        handler?(value)
        self.handler = handler
    }
}
