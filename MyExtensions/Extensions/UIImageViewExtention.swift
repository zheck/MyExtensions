//
//  UIImageViewExtention.swift
//  Foodvisor
//
//  Created by Lilia Belkahla on 22/05/2017.
//  Copyright © 2017 Foodvisor. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setAndCache(url: String, options: [KingfisherOptionsInfoItem] = []) {
        guard let url = URL(string: url) else { return }

        kf.setImage(with: url, placeholder: self.image, options: options)
    }


    func cancelRequest() {
        kf.cancelDownloadTask()
    }
}
