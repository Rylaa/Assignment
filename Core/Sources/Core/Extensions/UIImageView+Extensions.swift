//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation
import SDWebImage

public extension UIImageView {
    func load(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }

        sd_imageIndicator = SDWebImageActivityIndicator.gray
        sd_setImage(with: url)
    }
}
