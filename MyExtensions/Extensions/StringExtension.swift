//
//  StringExtension.swift
//  Foodvisor
//
//  Created by zhou on 5/16/17.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(with values: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments: values)
    }

    func truncate(length: Int, trailing: String = "…") -> String {
        if self.characters.count > length {
            return String(self.characters.prefix(length - 3)) + trailing
        } else {
            return self
        }
    }

    public func title() -> String {
        var string = "\(self)"

        if string == "" {return ""}

        string.replaceSubrange(self.startIndex...self.startIndex, with: String(self[self.startIndex]).capitalized)
        return string
    }

    var floatValue: Float {
        return (self as NSString).floatValue
    }

}
