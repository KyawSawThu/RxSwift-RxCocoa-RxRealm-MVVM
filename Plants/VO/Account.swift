//
//  Account.swift
//  Plants
//
//  Created by Riki on 11/21/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

class Account {
    
    var id: String
    var name: String
    var email: String
    
    init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    func save() {
        let ref = FirebaseRef.accounts(id: id).reference()
        ref.setValue(toDictionary())
    }
    
    func toDictionary()-> [String: Any] {
        return [
            "id": id,
            "name": name,
            "email": email
        ]
    }
}
