//
//  UILabelExtension.swift
//  MyExtensions
//
//  Created by Fong Zhou on 14/02/2017.
//  Copyright © 2017 Fong Zhou. All rights reserved.
//

import UIKit

extension UILabel {

    func widthFor(attributedString: NSAttributedString) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = attributedString.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.width)
    }

    func heightFor(attributedString: NSAttributedString, width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = attributedString.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.height)
    }

    func heightFor(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let attribute = [NSFontAttributeName: font]
        let attString = NSMutableAttributedString(string: text, attributes: attribute)

        return heightFor(attributedString: attString, width: width)
    }

    func widthFor(text: String, font: UIFont) -> CGFloat {
        let attribute = [NSFontAttributeName: font]
        let attString = NSMutableAttributedString(string: text, attributes: attribute)

        return widthFor(attributedString: attString)
    }

}
