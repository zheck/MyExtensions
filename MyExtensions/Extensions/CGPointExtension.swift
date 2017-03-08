//
//  CGPointExtension.swift
//  MyExtensions
//
//  Created by Fong Zhou on 07/03/2017.
//  Copyright © 2017 Fong Zhou. All rights reserved.
//

import UIKit

extension CGPoint {

    static func -(left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
}
