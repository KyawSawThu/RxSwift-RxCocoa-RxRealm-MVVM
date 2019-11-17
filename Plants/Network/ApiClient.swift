//
//  ApiClient.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RxSwift

protocol ApiClient {
    func fetchPlants()->Observable<PlantResponse>
}
