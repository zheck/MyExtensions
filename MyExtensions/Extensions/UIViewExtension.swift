//
//  UIViewExtension.swift
//  MyExtensions
//
//  Created by Fong Zhou on 14/02/2017.
//  Copyright © 2017 Fong Zhou. All rights reserved.
//

import UIKit

extension UIView {

    func addBackgroundLayer(from: UIColor, to: UIColor) {
        addBackgroundLayer(size: bounds, from: from, to: to)
    }

    func addBackgroundLayer(size: CGRect, from: UIColor, to: UIColor) {
        let gradient = CAGradientLayer()

        gradient.frame = size
        gradient.colors = [
            from.cgColor,
            to.cgColor
        ]

        layer.insertSublayer(gradient, at: 0)
    }

}
