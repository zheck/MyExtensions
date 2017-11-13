//
//  UIViewControllerExtension.swift
//  Foodvisor
//
//  Created by Fong Zhou on 13/11/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit


// MARK: - dealloc check

extension UIViewController {

    func clearNavigationBar() {
        let transparentPixel = UIImage()
        navigationController?.navigationBar.setBackgroundImage(transparentPixel, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = transparentPixel
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        navigationController?.navigationBar.isTranslucent = true
    }

    func setBackButton(image: UIImage, tintColor: UIColor, text: String) {
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        navigationController?.navigationBar.barTintColor = tintColor
        navigationController?.navigationBar.tintColor = tintColor
        navigationItem.title = text
    }

    public func dch_checkDeallocation(afterDelay delay: TimeInterval = 2.0) {
        let rootParentViewController = dch_rootParentViewController

        // We don’t check `isBeingDismissed` simply on this view controller because it’s common
        // to wrap a view controller in another view controller (e.g. in UINavigationController)
        // and present the wrapping view controller instead.
        if isMovingFromParentViewController || rootParentViewController.isBeingDismissed {
            let type = type(of: self)
            let disappearanceSource: String = isMovingFromParentViewController ? "removed from its parent" : "dismissed"

            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: { [weak self] in
                assert(self == nil, "\(type) not deallocated after being \(disappearanceSource)")
            })
        }
    }

    private var dch_rootParentViewController: UIViewController {
        var root = self

        while let parent = root.parent {
            root = parent
        }

        return root
    }

}
