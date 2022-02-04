//
//  TeamCollectionViewCell.swift
//  Deporte
//
//  Created by Abdo on 2/2/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    //MARK: -- IBOutlets

    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    //MARK: -- Properties
    var teamsCell : Team?{
        didSet{
            guard let teamsCell = teamsCell else {
                return
            }
            teamImg.kf.indicatorType = .activity
            teamImg.kf.setImage(with: URL(string: teamsCell.strTeamBadge ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            teamName.text = teamsCell.strTeam
        }
    }

    //MARK: -- LifeCycle
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
           
       }

    //MARK: -- IBActions

    //MARK: -- Functions
    func viewCellUI(){
        self.layer.shadowColor = UIColor.lightGray.cgColor
        //for actual cell
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 0.50
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        self.clipsToBounds = false
        self.contentView.layer.masksToBounds = true
    }
   

}
