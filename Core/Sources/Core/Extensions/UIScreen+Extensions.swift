//
//  File.swift
//  
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit

public extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
    
    static var minEdge: CGFloat {
        return UIScreen.main.bounds.minEdge
    }
}
