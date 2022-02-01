//
//  SportsCollectionViewCell.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell {
    //MARK: -- IBOutlets
    
    @IBOutlet weak var sportImg: UIImageView!
    @IBOutlet weak var sportTitle: UILabel!
    
    //MARK: -- Propertiest
    
    var sportItem : MySport?{
        didSet{
            guard let sportItem = sportItem else{return}
            sportImg.kf.indicatorType = .activity
            sportImg.kf.setImage(with: URL(string: sportItem.strSportThumb ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            sportTitle.text = sportItem.strSport
        }
    }
    
    //MARK: -- LifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //for image cell
        self.sportImg.layoutIfNeeded()
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        //for actual cell
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 5.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        self.clipsToBounds = false
        self.contentView.layer.masksToBounds = true
    }

    //MARK: -- IBActions
    
    //MARK: -- Functions
}
