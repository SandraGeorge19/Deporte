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
    
    var sportItem : Sport?{
        didSet{
            guard let sportItem = sportItem else{return}
            sportImg.kf.indicatorType = .activity
            sportImg.kf.setImage(with: URL(string: sportItem.image ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            sportTitle.text = sportItem.title
        }
    }
    
    //MARK: -- LifeCycle

    //MARK: -- IBActions
    
    //MARK: -- Functions
}
