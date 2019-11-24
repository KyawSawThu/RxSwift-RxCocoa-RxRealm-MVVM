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
        return UIImage(named: "fav_filled_icon")!
    }
    
    static var unSetFavorite: UIImage {
        return UIImage(named: "fav_icon")!
    }
    
    static var Temperature: UIImage {
        return UIImage(named: "temperature_icon")!
    }
    
    static var Light: UIImage {
        return UIImage(named: "light_icon")!
    }
    
    static var Placement: UIImage {
        return UIImage(named: "placement_icon")!
    }
    
}
