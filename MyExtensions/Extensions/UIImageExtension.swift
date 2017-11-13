//
//  UIImageExtension.swift
//  Foodvisor
//
//  Created by Fong Zhou on 06/06/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

extension UIImage {

    static func fromString(_ string: String?) -> UIImage? {
        guard let base64String = string else { return nil }
        guard let data = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) else { return nil }

        return UIImage(data: data)
    }

    func crop(rect: CGRect) -> UIImage {
        var rect = rect

        rect.origin.x *= self.scale
        rect.origin.y *= self.scale
        rect.size.width *= self.scale
        rect.size.height *= self.scale

        if let cgImage = self.cgImage {
            let imageRef = cgImage.cropping(to: rect)!
            let image = UIImage(cgImage: imageRef, scale: scale, orientation: imageOrientation)

            return image
        }

        return self
    }
}

extension UIImage {
    public func imageRotatedByDegrees(_ degrees: CGFloat, flip: Bool) -> UIImage {
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(Double.pi)
        }

        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
        let t = CGAffineTransform(rotationAngle: degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size

        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()

        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap!.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0);

        //   // Rotate the image context
        bitmap!.rotate(by: degreesToRadians(degrees));

        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat

        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }

        bitmap!.scaleBy(x: yFlip, y: -1.0)
        bitmap!.draw(cgImage!, in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
