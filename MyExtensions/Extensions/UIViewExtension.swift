//
//  UIViewExtension.swift
//  Foodvisor
//
//  Created by zhou on 5/18/17.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

extension UIView {

    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }

    func highlight(scale: CGFloat = 1.3) {
        UIView.animate(
            withDuration: 0.6,
            delay: 0,
            options: [.autoreverse, .repeat],
            animations: {
                self.transform = CGAffineTransform(scaleX: scale, y: scale)
            },
            completion: nil
        )
    }

    func addGradient(from: UIColor, to: UIColor, frame: CGRect? = nil, vertical: Bool = false) {
        // add gradient
        let bgGradient = CAGradientLayer()

        bgGradient.colors = [from.cgColor, to.cgColor]
        bgGradient.locations = [0.15, 0.85]
        bgGradient.frame = frame ?? self.bounds
        bgGradient.startPoint = CGPoint(x: 0, y: 0)
        bgGradient.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)

        self.layer.insertSublayer(bgGradient, at: 0)
    }

    func contentRect() -> CGRect {
        /*
         * Compute optimal content rectangle
         */
        var contentRect = CGRect.zero
        for view in self.subviews[1..<self.subviews.count] {
            contentRect = contentRect.union(view.frame)
        }

        return contentRect
    }

}
