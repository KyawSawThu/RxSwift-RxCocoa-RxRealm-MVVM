//
//  SharedApiClient.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RxSwift

class SharedApiClient: BaseApiClient {
    
    private static var sharedApiClient: SharedApiClient = {
        return SharedApiClient()
    }()
    
    class func shared()->SharedApiClient {
        return sharedApiClient
    }
}

extension SharedApiClient: ApiClient{
    func fetchPlants() -> Observable<PlantResponse> {
        return self.requestApiData(url: API.GET_All_PLANTS, method: .post, params: [:], headers: [:], value: PlantResponse.self)
    }
    
    
}
