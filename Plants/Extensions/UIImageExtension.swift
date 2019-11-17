//
//  UIImageExtension.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit

extension UIImage{
    
    static var placeholder: UIImage {
        return UIImage(named: "placeholder")!
    }
    
    static var setFavorite: UIImage {
        return UIImage(named: "heart_filled_icon")!
    }
    
    static var unSetFavorite: UIImage {
        return UIImage(named: "heart_icon")!
    }
    
}
