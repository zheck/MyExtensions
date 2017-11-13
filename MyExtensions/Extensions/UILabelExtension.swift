//
//  UILabelExtension.swift
//  Foodvisor
//
//  Created by Lilia Belkahla on 31/05/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

extension UILabel {

    // setup with localizable string key
    func setup(key: String, color: UIColor? = nil, font: UIFont) {
        self.text = key.localized()

        if color != nil {
            self.textColor = color
        }

        self.font = font
    }

    func intValue() -> Int {
        guard let text = text else { return 0 }
        guard let integer = Int(text) else { return 0 }
        return integer
    }

    class func widthFor(attributedString: NSAttributedString) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = attributedString.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.width)
    }

    class func heightFor(attributedString: NSAttributedString, width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = attributedString.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.height)
    }

    class func heightFor(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let attribute = [NSFontAttributeName: font]
        let attString = NSMutableAttributedString(string: text, attributes: attribute)

        return heightFor(attributedString: attString, width: width)
    }

    class func widthFor(text: String, font: UIFont) -> CGFloat {
        let attribute = [NSFontAttributeName: font]
        let attString = NSMutableAttributedString(string: text, attributes: attribute)

        return widthFor(attributedString: attString)
    }
    
}
