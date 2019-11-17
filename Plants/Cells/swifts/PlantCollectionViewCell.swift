//
//  PlantCollectionViewCell.swift
//  Plants
//
//  Created by Riki on 11/17/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit

class PlantCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivPlant: UIImageView!
    
    var mData: FavoritePlant? {
        didSet{
            guard let data = mData else { return }
            ivPlant.setImageWithKF(urlString: data.plantPhoto)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ivPlant.layer.cornerRadius = 20
    }

}
