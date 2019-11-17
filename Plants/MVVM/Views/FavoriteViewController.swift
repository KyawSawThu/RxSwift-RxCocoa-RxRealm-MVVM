//
//  FavoriteViewController.swift
//  Plants
//
//  Created by Riki on 11/17/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import RxSwift

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    private let mViewModel: FavoriteViewModel = FavoriteViewModel()
    private let disposeBag: DisposeBag = DisposeBag()
    var mPlants: [FavoritePlant] = [FavoritePlant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        initDataObservation()
        
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

    }
    
    fileprivate func bindData(plants: [FavoritePlant]) {
        mPlants = plants
        favoriteCollectionView.reloadData()
    }
    
    fileprivate func initCollectionView() {
        favoriteCollectionView.delegate = self
        favoriteCollectionView.backgroundColor = .clear
        
//        let cellScale = CGFloat(0.4)
//        let viewWidth = self.view.frame.width
//        let cellWidth = viewWidth * cellScale
//        let cellHeight = viewWidth * cellScale
        
        favoriteCollectionView.registerWithItem(nibName: String(describing: PlantCollectionViewCell.self))
        
//        let layout = favoriteCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
//        layout.minimumInteritemSpacing = 5
//        layout.minimumInteritemSpacing = 10
    }

}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        return CGSize(width: 120, height: 120)
    }
}
