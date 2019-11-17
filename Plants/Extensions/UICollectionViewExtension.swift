//
//  UICollectionViewExtension.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerWithItem(nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: nibName)
    }
}
