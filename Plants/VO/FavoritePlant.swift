//
//  FavoritePlant.swift
//  Plants
//
//  Created by Riki on 11/17/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RealmSwift

class FavoritePlant: Object {
    
    @objc dynamic var plantId: String = ""
    @objc dynamic var plantPhoto: String = ""
    
    override class func primaryKey() -> String? {
        return "plantId"
    }
}
