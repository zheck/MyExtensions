//
//  UIImageViewExtension.swift
//  MyExtensions
//
//  Created by Fong Zhou on 15/02/2017.
//  Copyright © 2017 Fong Zhou. All rights reserved.
//

import UIKit

extension UIImageView {

    class func resize(image: UIImage, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)

        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return scaledImage!
    }

}
