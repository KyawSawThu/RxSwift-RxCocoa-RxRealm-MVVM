//
//  PlantModel.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RxSwift

protocol PlantModel {
    func fetchPlants()->Observable<PlantResponse>
}
