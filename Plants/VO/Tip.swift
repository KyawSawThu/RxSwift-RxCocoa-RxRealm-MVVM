//
//  Tip.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

class Tip: Codable {
    var temperature: String
    var light: String
    var placement: String
    
    init(){
        self.temperature = ""
        self.light = ""
        self.placement = ""
    }
}
