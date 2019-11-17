//
//  HomeViewModel.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class HomeViewModel: BaseViewModel {
    
    public var plants: BehaviorRelay<[Plant]> = BehaviorRelay(value: [])
    
    override init(){
        super.init()
        self.fetchData()
    }
    
    func fetchData() {
        self.isLoadingObs.accept(true)
        
        apiService
            .fetchPlants()
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe( onNext: { data in
                self.plants.accept(data.data!)
                self.isLoadingObs.accept(false)
            }, onError: { error in
                self._errorObs.accept(error.localizedDescription)
                self.isLoadingObs.accept(false)
            })
            .disposed(by: disposeBag)
        
    }
}


