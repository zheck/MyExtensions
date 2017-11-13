//
//  NSCoderExtension.swift
//  Foodvisor
//
//  Created by Fong Zhou on 07/07/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

extension NSCoder {

    func decodeStringForKey(_ key: String) -> String {
        return (decodeObject(forKey: key) as? String) ?? ""
    }

    func decodeDataForKey(_ key: String) -> Data {
        return (decodeObject(forKey: key) as? Data) ?? Data()
    }

    func decodeStringsForKey(_ key: String) -> [String] {
        return (decodeObject(forKey: key) as? [String]) ?? []
    }

    func decodeFloatsForKey(_ key: String) -> [Float] {
        return (decodeObject(forKey: key) as? [Float]) ?? []
    }

    func decodeFrameForKey(_ key: String) -> CGRect {
        let string = decodeStringForKey(key)
        return CGRectFromString(string)
    }

}
