//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import SnapKit
import UIKit

public final class Spinner {
    public static var baseBackColor = UIColor.darkGray.withAlphaComponent(0.5)
    public static var baseColor = UIColor.white
    private static var activityIndicator: UIActivityIndicatorView?
    private static var backgroundView = UIView()

    public static func start(backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor) {
        DispatchQueue.main.async {
            if activityIndicator == nil,
               let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                addBackgrounView()
                setupActivityIndicator(baseColor: baseColor)
                window.addSubview(backgroundView)
                window.addSubview(activityIndicator!)

                activityIndicator?.startAnimating()
            }
        }
    }

    public static func stop() {
        DispatchQueue.main.async {
            if activityIndicator != nil {
                backgroundView.removeFromSuperview()
                activityIndicator?.stopAnimating()
                activityIndicator?.removeFromSuperview()
                activityIndicator = nil
            }
        }
    }

    @objc public static func update() {
        if activityIndicator != nil {
            stop()
            start(baseColor: baseColor)
        }
    }

    private static func setupActivityIndicator(baseColor: UIColor) {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.color = baseColor
        activityIndicator?.backgroundColor = baseBackColor
        activityIndicator?.center = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height / 2)
    }

    private static func addBackgrounView() {
        backgroundView.backgroundColor = .white.withAlphaComponent(0.5)
        backgroundView.frame = CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
}
