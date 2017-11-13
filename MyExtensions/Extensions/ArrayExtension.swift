//
//  ArrayExtension.swift
//  Foodvisor
//
//  Created by Fong Zhou on 27/09/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

extension Array {

    func grouped<T>(by criteria: (Element) -> T) -> [T: [Element]] {
        var groups = [T: [Element]]()
        for element in self {
            let key = criteria(element)
            if groups.keys.contains(key) == false {
                groups[key] = [Element]()
            }
            groups[key]?.append(element)
        }
        return groups
    }

}

extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        guard self.count == other.count else { return false }
        return self.count == other.count &&   self.sorted() == other.sorted()
    }
}
