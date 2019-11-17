//
//  Plant.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

class Plant: Codable{
    var plantId: String
    var plantName: String
    var description: String
    var topTip: String
    var tips: Tip
    var uploadedUser: User
    var plantPhoto: String
    
}
