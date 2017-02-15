//
//  StringExtension.swift
//  MyExtensions
//
//  Created by Fong Zhou on 15/02/2017.
//  Copyright © 2017 Fong Zhou. All rights reserved.
//

import UIKit

extension String {

    private static let allowedCharacters = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-")

    public func slugify() -> String {
        let cocoaString = NSMutableString(string: self)
        CFStringTransform(cocoaString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(cocoaString, nil, kCFStringTransformStripCombiningMarks, false)
        CFStringLowercase(cocoaString, .none)

        return String(cocoaString)
            .components(separatedBy: String.allowedCharacters.inverted)
            .filter { $0 != "" }
            .joined(separator: "-")
    }

    func htmlStripped() -> String {
        do {
            let str = try NSAttributedString(
                data: self.data(using: .unicode, allowLossyConversion: true)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil)
            return str.string
        }
        catch {
            return self
        }
    }

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }


    func localized(args: CVarArg) -> String {
        return String(format: NSLocalizedString(self, comment: ""), args)
    }

}
