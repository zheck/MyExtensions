//
//  UIColorExtension.swift
//  Foodvisor
//
//  Created by Fong Zhou on 18/05/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }

    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }

    convenience init(hex: String, alpha: CGFloat = 1) {
        guard hex != "" else {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
            return
        }

        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)

        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)

        self.init(red: Int(r), green: Int(g), blue: Int(b), a: alpha)
    }

}


extension UIColor {

    public class var generalBackground: UIColor {
        return UIColor(white: 242, alpha: 1)
    }

    public class var calories: UIColor {
        return UIColor(red: 0.0 / 255, green: 195.0 / 255, blue: 147.0 / 255, alpha: 1)
    }

    public class var darkCalories: UIColor {
        return UIColor(red: 1.0 / 255, green: 107.0 / 255, blue: 80.0 / 255, alpha: 1)
    }

    public class var shadowCalories: UIColor {
        return UIColor(red: 63.0 / 255, green: 170.0 / 255, blue: 144.0 / 255, alpha: 1)
    }

    public class var shadowProteins: UIColor {
        return UIColor(red: 161.0 / 255, green: 74.0 / 255, blue: 70.0 / 255, alpha: 1)
    }

    public class var proteins: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 97.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)
    }

    public class var darkProteins: UIColor {
        return UIColor(red: 169.0 / 255.0, green: 41.0 / 255.0, blue: 6.0 / 255.0, alpha: 1.0)
    }

    public class var lipids: UIColor {
        return UIColor(red: 243.0 / 255.0, green: 206.0 / 255.0, blue: 12.0 / 255.0, alpha: 1.0)
    }

    public class var darkLipids: UIColor {
        return UIColor(red: 186.0 / 255.0, green: 157.0 / 255.0, blue: 9.0 / 255.0, alpha: 1.0)
    }

    public class var carbs: UIColor {
        return UIColor(red: 184.0 / 255.0, green: 94.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
    }

    public class var darkCarbs: UIColor {
        return UIColor(red: 93.0 / 255.0, green: 36.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
    }

    public class var fibers: UIColor {
        return UIColor(red: 91.0 / 255.0, green: 135.0 / 255.0, blue: 227.0 / 255.0, alpha: 1.0)
    }

    public class var darkFibers: UIColor {
        return UIColor(red: 29.0 / 255.0, green: 60.0 / 255.0, blue: 127.0 / 255.0, alpha: 1.0)
    }

    public class var random: UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(100)) / 100.0, green: CGFloat(arc4random_uniform(100)) / 100.0, blue: CGFloat(arc4random_uniform(100)) / 100.0, alpha: 1)
    }

    public class var backgroundFibers: UIColor {
        return UIColor(red: 65.0 / 255.0, green: 169.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
    }

    public class var backgroundLipids: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 190.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
    }

    public class var backgroundCarbs: UIColor {
        return UIColor(red: 138.0 / 255.0, green: 99.0 / 255.0, blue: 179.0 / 255.0, alpha: 1.0)
    }

    public class var backgroundProteins: UIColor {
        return UIColor(red: 226.0 / 255.0, green: 97.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
    }

    public class var backgroundGrey: UIColor {
        return UIColor(white: 245.0 / 255.0, alpha: 1.0)
    }

    public class var greyish: UIColor {
        return UIColor(white: 182.0 / 255.0, alpha: 1.0)
    }

    public class var greyishBrown: UIColor {
        return UIColor(white: 66 / 255.0, alpha: 1.0)
    }

    public class var warmGrey: UIColor {
        return UIColor(white: 151.0 / 255.0, alpha: 1.0)
    }

    public class var placeholderGrey: UIColor {
        return UIColor(white: 207.0 / 255.0, alpha: 1.0)
    }

    public class var backgroundCalories: UIColor {
        return UIColor(red: 62.0 / 255.0, green: 196.0 / 255.0, blue: 164.0 / 255.0, alpha: 1.0)
    }

    public class var customCalories: UIColor {
        return UIColor(red: 16.0 / 255.0, green: 180.0 / 255.0, blue: 139.0 / 255.0, alpha: 1.0)
    }

    public class var ultimateBlack: UIColor {
        return UIColor(white: 66.0 / 255.0, alpha: 1.0)
    }

    public class var toolbarGray: UIColor {
        return UIColor(white: 233.0 / 255.0, alpha: 1.0)
    }
}
