//
//  BaseViewModel.swift
//  Plants
//
//  Created by Riki on 11/17/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class BaseViewModel {
    public var isLoadingObs: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public var _errorObs: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
    let apiService = SharedPlantModel.shared()
    let db = RealmHelper.shared
    
    let disposeBag = DisposeBag()
}
