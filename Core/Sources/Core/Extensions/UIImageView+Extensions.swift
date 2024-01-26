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

    func loadImageFromURL(_ url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.image = image
                    }
                }
            }
        }
    }
}
