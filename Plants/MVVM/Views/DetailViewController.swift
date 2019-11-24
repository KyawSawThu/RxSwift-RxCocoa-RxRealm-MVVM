//
//  DetailViewController.swift
//  Plants
//
//  Created by Riki on 11/19/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    
    @IBOutlet weak var tipCollectionView: UICollectionView!
    
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var ivPlant: UIImageView!
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblPlantDescription: UILabel!
    
    private let db = RealmHelper.shared
    
    
    var mData: Plant?
    var mTip: Tip = Tip()
    var tipData: [[String: String]] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initData()
    }
    
    fileprivate func initUI() {
        ivPlant.roundCorners(tLeft: 35, tRight: 35, bLeft: 5, bRight: 5)
        ivUserProfile.roundCorner()
        
        lblPlantDescription.numberOfLines = 6
        lblPlantDescription.tintAdjustmentMode = .automatic
        lblPlantDescription.textAlignment = .justified
        
        btnFavorite.backgroundColor = .white
        btnFavorite.layer.borderColor = UIColor.primary.cgColor
        btnFavorite.layer.borderWidth = 2
        btnFavorite.layer.cornerRadius = 15
        btnFavorite.setImage(UIImage.setFavorite, for: .selected)
        btnFavorite.setImage(UIImage.unSetFavorite, for: .normal)
        
        tipCollectionView.backgroundColor = .clear
        tipCollectionView.dataSource = self
        tipCollectionView.registerWithItem(nibName: String(describing: TipCollectionViewCell.self))
        tipCollectionView.setHorizontalFlowLayout(cellWidthScale: 0.35, cellHeightScale: 0.225, cellPadding: 20, showIndicator: false)
        
    }
    
    fileprivate func initData() {
        guard let data = mData else { return }
        ivPlant.setImageWithKF(urlString: data.plantPhoto)
        ivUserProfile.setImageWithKF(urlString: data.uploadedUser.userPhoto)
        lblPlantName.text = data.plantName
        lblUser.text = "By \(data.uploadedUser.name)"
        lblPlantDescription.text = data.description
        btnFavorite.isSelected = db.isAlreadySet(plantId: data.plantId)
        
        mTip = data.tips
        let temperature = [SharedConstants.Tip.Temperature: mTip.temperature]
        let light = [SharedConstants.Tip.Light: mTip.light]
        let placement = [SharedConstants.Tip.Placement: mTip.placement]
        tipData = [temperature, light, placement]
        
    }
    
    @IBAction func onClickFavorite(_ sender: Any) {
        btnFavorite.isSelected.toggle()
        
        guard let data = mData else { return }
        if btnFavorite.isSelected {
            //TODO:- set favorite
            db.saveData(plantId: data.plantId, plantPhoto: data.plantPhoto)
        } else {
            //TODO:- unset favorite
            db.deleteData(plantId: data.plantId)
        }
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClickShare(_ sender: Any) {
    }
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TipCollectionViewCell.self), for: indexPath) as! TipCollectionViewCell
        cell.mData = tipData[indexPath.row]
        return cell
        
    }
    
    
}
