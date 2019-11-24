//
//  UICollectionViewExtension.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func setVerticalFlowLayout(parentViewSize: CGSize,cellPadding: CGFloat, numberOfItemsPerRow: Int, showIndicator: Bool) {

        let noOfItems = CGFloat(numberOfItemsPerRow)
//        let screenSize = UIScreen.main.bounds.size
        let totalPadding: CGFloat = cellPadding * (noOfItems + 1)
        let cellWidth = (parentViewSize.width - totalPadding) / noOfItems
        let cellHeight = (parentViewSize.width - totalPadding) / noOfItems
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumInteritemSpacing = cellPadding
        layout.minimumLineSpacing = cellPadding
        
        self.setCollectionViewLayout(layout, animated: true)
        self.showsVerticalScrollIndicator = showIndicator
        self.contentInset = UIEdgeInsets(top: cellPadding, left: cellPadding, bottom: cellPadding, right: cellPadding)
    }
    
    func setHorizontalFlowLayout(cellWidthScale: CGFloat, cellHeightScale: CGFloat, cellPadding: CGFloat, showIndicator: Bool){
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = screenSize.width * cellWidthScale
        let cellHeight = screenSize.height * cellHeightScale
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumInteritemSpacing = cellPadding
        
        self.setCollectionViewLayout(layout, animated: true)
        self.showsHorizontalScrollIndicator = showIndicator
        self.contentInset = UIEdgeInsets(top: cellPadding, left: cellPadding, bottom: cellPadding, right: cellPadding)
        
    }
    
    func registerWithItem(nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
}

