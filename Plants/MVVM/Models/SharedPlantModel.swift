//
//  SharedPlantModel.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RxSwift

class SharedPlantModel: BaseModel {
    
    private static var sharedPlantModel: SharedPlantModel = {
        return SharedPlantModel()
    }()
    
    class func shared()->SharedPlantModel {
        return sharedPlantModel
    }
    
}

extension SharedPlantModel: PlantModel {
    func fetchPlants() -> Observable<PlantResponse> {
        return SharedApiClient.shared().fetchPlants()
    }
    
    
}
