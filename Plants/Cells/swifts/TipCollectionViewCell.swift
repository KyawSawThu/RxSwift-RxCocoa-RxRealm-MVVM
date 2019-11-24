//
//  TipCollectionViewCell.swift
//  Plants
//
//  Created by Riki on 11/19/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit

class TipCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vParent: UIView!
    @IBOutlet weak var vTip: UIView!
    @IBOutlet weak var ivTip: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var mData: [String: String]? {
        didSet{
            guard let data = mData else { return }
                
            switch data.keys.first {
            case SharedConstants.Tip.Temperature:
                ivTip.image = UIImage.Temperature
                lblTitle.text = SharedConstants.Tip.Temperature
                lblDescription.text = data[SharedConstants.Tip.Temperature]
                break
            case SharedConstants.Tip.Light:
                ivTip.image = UIImage.Light
                lblTitle.text = SharedConstants.Tip.Light
                lblDescription.text = data[SharedConstants.Tip.Light]
                break
            case SharedConstants.Tip.Placement:
                ivTip.image = UIImage.Placement
                lblTitle.text = SharedConstants.Tip.Placement
                lblDescription.text = data[SharedConstants.Tip.Placement]
                break
            default:
                break
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vParent.layer.cornerRadius = 20
        vTip.layer.cornerRadius = 10
        
    }

}
