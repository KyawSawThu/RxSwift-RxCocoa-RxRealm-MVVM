//
//  HomeViewController.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import LGSideMenuController
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    @IBOutlet weak var ivTitleBar: UIImageView!
    @IBOutlet weak var plantTableView: UITableView!
    
    private let mViewModel: HomeViewModel = HomeViewModel()
    private let disposeBag: DisposeBag = DisposeBag()
    var mPlants: [Plant] = [Plant]()
    
    var activityView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataObservation()
        initTableView()
        setUpUI()
    }
    
    fileprivate func setUpUI(){
        
        ivTitleBar.roundCorners(tLeft: 35, tRight: 35, bLeft: 35, bRight: 5)
        
        self.view.backgroundColor = .accent
        
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    fileprivate func initTableView() {
        plantTableView.backgroundColor = .clear
        plantTableView.separatorStyle = .none
        plantTableView.showsVerticalScrollIndicator = false
        plantTableView.backgroundView = .none
        
        plantTableView.registerWithCell(nibName: String(describing: PlantTableViewCell.self))
        
        plantTableView.dataSource = self
    }
    
    fileprivate func initDataObservation() {
        mViewModel
            .plants
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { data in
                self.bindData(plants: data)
            }).disposed(by: disposeBag)
        
        mViewModel
            .isLoadingObs
            .observeOn(MainScheduler.instance)
            .map{!$0}
            .bind(to: self.activityView.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    fileprivate func bindData(plants: [Plant]) {
        mPlants = plants
        plantTableView.reloadData()
    }
    
    @IBAction func onClickMenuButton(_ sender: Any) {
        let vc = (UIApplication.shared.windows.first?.rootViewController) as! LGSideMenuController
        vc.showLeftViewAnimated()
    }
    
}
    


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mPlants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlantTableViewCell.self), for: indexPath) as! PlantTableViewCell
        cell.mPlant = mPlants[indexPath.row]
        return cell
    }
    
    
}
