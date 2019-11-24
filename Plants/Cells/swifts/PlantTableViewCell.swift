//
//  PlantTableViewCell.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import Kingfisher

class PlantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vParentView: UIView!
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var ivPlant: UIImageView!
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    
    private var db = RealmHelper.shared
    
    var mPlant: Plant? {
        didSet{
            guard let data = mPlant else { return }
            guard let user = mPlant?.uploadedUser else { return}
            lblPlantName.text = data.plantName
            lblUser.text = "By \(user.name)"
            ivPlant.setImageWithKF(urlString: data.plantPhoto)
            ivProfile.setImageWithKF(urlString: user.userPhoto)
            btnFavorite.isSelected = db.isAlreadySet(plantId: data.plantId)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        initView()
    }
    
    fileprivate func initView() {
        ivProfile.layer.cornerRadius = ivProfile.frame.height / 2
        
        vParentView.backgroundColor = .white
        vParentView.alpha = 1
        vParentView.roundCorners(tLeft: 5, tRight: 0, bLeft: 25, bRight: 0)
        
        btnFavorite.setBackgroundImage(UIImage.setFavorite, for: .selected)
        btnFavorite.setBackgroundImage(UIImage.unSetFavorite, for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func onClickFavorite(_ sender: Any) {
        guard let data = mPlant else { return }
        
        btnFavorite.isSelected.toggle()
        if btnFavorite.isSelected {
            //TODO:- set favorite
            db.saveData(plantId: data.plantId, plantPhoto: data.plantPhoto)
        } else {
            //TODO:- unset favorite
            db.deleteData(plantId: data.plantId)
        }
    }
    
    
}
