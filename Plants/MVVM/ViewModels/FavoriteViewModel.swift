//
//  FavoriteViewModel.swift
//  Plants
//
//  Created by Riki on 11/17/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class FavoriteViewModel: BaseViewModel {
    
    public var plants: BehaviorRelay<[FavoritePlant]> = BehaviorRelay(value: [])
    
    override init() {
        super.init()
        self.fetchData()
    }
    
    func fetchData() {
        self.isLoadingObs.accept(true)
        
        db
            .retrieveData()
            .subscribe(onNext: { data in
                self.plants.accept(data)
                self.isLoadingObs.accept(false)
            })
            .disposed(by: disposeBag)
    }
    
}
