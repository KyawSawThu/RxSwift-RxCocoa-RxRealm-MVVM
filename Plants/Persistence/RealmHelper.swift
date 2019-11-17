//
//  RealmHelper.swift
//  Plants
//
//  Created by Riki on 11/17/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RxRealm
import Realm
import RealmSwift
import RxSwift

class RealmHelper {
    
    let realm = try! Realm()
    
    static let shared = RealmHelper()
    
    private init(){}
    
    func saveData(plantId: String, plantPhoto: String) {
        
        let favoritePlant = FavoritePlant()
        favoritePlant.plantId = plantId
        favoritePlant.plantPhoto = plantPhoto
        
        do{
            try realm.write {
                realm.add(favoritePlant, update: .modified)
            }
        } catch {
            print("SaveToPersistenceError:- \(error.localizedDescription)")
        }
        
    }
    
    func deleteData(plantId: String) {
        let plant = realm.object(ofType: FavoritePlant.self, forPrimaryKey: plantId)
        do {
            try realm.write {
                realm.delete(plant!)
            }
        } catch {
            print("DeleteFromPersistenceError:- \(error.localizedDescription)")
        }
    }
    
    func retrieveData()->Observable<[FavoritePlant]> {
        return Observable.array(from: realm.objects(FavoritePlant.self))
    }
    
    func isAlreadySet(plantId: String)-> Bool {
        if let _ = realm.object(ofType: FavoritePlant.self, forPrimaryKey: plantId) {
            return true
        } else {
            return false
        }
    }
    
    
}

