//
//  FavoriteViewController.swift
//  Plants
//
//  Created by Riki on 11/17/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import RxSwift
import FirebaseAuth

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    private let mViewModel: FavoriteViewModel = FavoriteViewModel()
    private let homeViewModel: HomeViewModel = HomeViewModel()
    private let disposeBag: DisposeBag = DisposeBag()
    
    var mPlants: [Plant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        initDataObservation()
        
    }
    
    @IBAction func onClickSignOut(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    fileprivate func initDataObservation() {
        mViewModel
            .plants
            .observeOn(MainScheduler.instance)
            .bind(to: favoriteCollectionView.rx.items) { collectionView, index, item in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PlantCollectionViewCell.self), for: IndexPath(item: index, section: 0)) as! PlantCollectionViewCell
                cell.mData = item
                return cell
            }
            .disposed(by: disposeBag)
        
        homeViewModel
            .plants
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { data in
                self.bindData(data: data)
            })
            .disposed(by: disposeBag)
        
        favoriteCollectionView
            .rx
            .modelSelected(FavoritePlant.self)
            .bind { model in
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
                vc.mData = self.filterData(fav: model)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)

    }
    
    fileprivate func bindData(data: [Plant]) {
        mPlants = data
    }
    
    fileprivate func filterData(fav: FavoritePlant)->Plant {
        let plant = mPlants.filter{ $0.plantId == fav.plantId }
        return plant.first!
    }
    
    fileprivate func initCollectionView() {
        favoriteCollectionView.backgroundColor = .clear
        favoriteCollectionView.registerWithItem(nibName: String(describing: PlantCollectionViewCell.self))
        favoriteCollectionView.setVerticalFlowLayout(parentViewSize: CGSize(width: 300, height: 800), cellPadding: 12, numberOfItemsPerRow: 2, showIndicator: false)
        
    }

}
