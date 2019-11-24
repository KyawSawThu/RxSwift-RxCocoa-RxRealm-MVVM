//
//  FirebaseRef.swift
//  Plants
//
//  Created by Riki on 11/21/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import FirebaseDatabase

enum FirebaseRef {
    case root
    case accounts(id: String)
    
    private var rootRef: DatabaseReference {
        return Database.database().reference()
    }
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .accounts(id: let id):
            return "accounts/\(id)"
        }
    }
    
    func reference()-> DatabaseReference {
        switch self {
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }

}
