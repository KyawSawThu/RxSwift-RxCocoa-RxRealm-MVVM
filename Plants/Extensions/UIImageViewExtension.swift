//
//  UIImageViewExtension.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImageWithKF(urlString: String) {
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: URL(string: urlString),
            placeholder: UIImage.placeholder,
            options: [
                .transition(.fade(2)),
                .cacheOriginalImage
            ]
        )
    }
}

