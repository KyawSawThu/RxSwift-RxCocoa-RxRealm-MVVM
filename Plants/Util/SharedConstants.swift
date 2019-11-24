//
//  SharedConstants.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit

class SharedConstants {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    enum Colors {
        static let PRIMARY_COLOR = "PrimaryColor"
        static let ACCENT_COLOR = "AccentColor"
    }
    
    enum Tip {
        static let Temperature = "Temperature"
        static let Light = "Light"
        static let Placement = "Placement"
    }
    
    enum ErrorMessage {
        static let ValidateError = "Please fill validate data."
    }
}
