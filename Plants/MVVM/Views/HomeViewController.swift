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
    
    static let identifier = "HomeViewController"
    
    @IBOutlet weak var ivTitleBar: UIImageView!
    @IBOutlet weak var plantTableView: UITableView!
    
    private let mViewModel: HomeViewModel = HomeViewModel()
    private let disposeBag: DisposeBag = DisposeBag()
    var mPlants: [Plant] = [Plant]()
    
    var activityView = UIActivityIndicatorView(style: .large)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        plantTableView.reloadData()
    }
    
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
        
    }
    
    fileprivate func initTableView() {
        plantTableView.backgroundColor = .clear
        plantTableView.separatorStyle = .none
        plantTableView.showsVerticalScrollIndicator = false
        plantTableView.backgroundView = .none
        
        plantTableView.registerWithCell(nibName: String(describing: PlantTableViewCell.self))
    
        plantTableView.dataSource = self
        plantTableView.delegate = self
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
            .map{$0}
            .bind(to: self.activityView.rx.isAnimating)
            .disposed(by: disposeBag)
        
    }
    
    fileprivate func bindData(plants: [Plant]) {
        mPlants = plants
        plantTableView.reloadData()
    }
    
//    @IBAction func onClickMenuButton(_ sender: Any) {
//        let vc = (UIApplication.shared.windows.first!.rootViewController) as! LGSideMenuController
//        vc.showLeftViewAnimated()
//    }
    
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

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        vc.mData = self.mPlants[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

//        RxCocoa Binding Process

//        mViewModel
//            .plants
//            .observeOn(MainScheduler.instance)
//            .bind(to: plantTableView.rx.items) { tableView, index, item in
//                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlantTableViewCell.self), for: IndexPath(row: index, section: 0)) as! PlantTableViewCell
//                cell.mPlant = item
//                return cell
//            }
//            .disposed(by: disposeBag)

//        Observable
//            .zip(plantTableView.rx.itemSelected, plantTableView.rx.modelSelected(Plant.self))
//            .bind{ index, model in
//                print(model.uploadedUser.name)
//                let sb = UIStoryboard(name: "Main", bundle: nil)
//                let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
//                vc.mData = model
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//            }
//            .disposed(by: disposeBag)

//plantTableView
//            .rx
//            .modelSelected(Plant.self).bind{ model in
//                let sb = UIStoryboard(name: "Main", bundle: nil)
//                let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
//                vc.mData = model
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//            }
//            .disposed(by: disposeBag)
