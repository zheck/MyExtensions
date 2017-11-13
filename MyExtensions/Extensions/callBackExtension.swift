//
//  callBackExtension.swift
//  Foodvisor
//
//  Created by Fong Zhou on 09/06/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit

class CallbackContainer {

    let callback: () -> Void

    init(callback: @escaping () -> Void) {
        self.callback = callback
    }

    @objc func callCallback() {
        callback()
    }

}

extension UIControl {

    @discardableResult
    func addCallback(callback: @escaping () -> Void, forControlEvents controlEvents: UIControlEvents) -> UnsafeMutableRawPointer {

        let callbackContainer = CallbackContainer(callback: callback)
        let key = Unmanaged.passUnretained(callbackContainer).toOpaque()
        objc_setAssociatedObject(self, key, callbackContainer, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(callbackContainer, action: #selector(CallbackContainer.callCallback), for: controlEvents)

        return key
    }

    func removeCallbackForKey(key: UnsafeRawPointer) {
        if let callbackContainer = objc_getAssociatedObject(self, key) as? CallbackContainer {
            removeTarget(callbackContainer, action: #selector(CallbackContainer.callCallback), for: .allEvents)
            objc_setAssociatedObject(self, key, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

