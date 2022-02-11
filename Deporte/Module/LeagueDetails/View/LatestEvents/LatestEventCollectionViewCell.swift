//
//  LatestEventCollectionViewCell.swift
//  Deporte
//
//  Created by Abdo on 2/2/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class LatestEventCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    var event:Event?
    var teams:[Team] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCellUI()
        
    }
    func setUpView() {
        awayTeamNameLabel.text = event?.strAwayTeam ?? "No Name"
        homeTeamNameLabel.text = event?.strHomeTeam ?? "No Name"
        resultLabel.text = "\(String(describing: event?.intAwayScore ?? "0")):\(String(describing: event?.intHomeScore ?? "0"))"
                if teams.count > 0 {
                    var list=teams.filter{(team) in
                    team.idTeam == event?.idHomeTeam ?? "00"
                    }
                    if list.count>0{
                        homeTeamImageView.kf.setImage(with: URL(string:list[0].strTeamBadge ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png") )

                    }
                    list=teams.filter{(team) in
                    team.idTeam == event?.idAwayTeam ?? ""
                    }
                    if list.count > 0 {
                        awayTeamImageView.kf.setImage(with: URL(string: list[0].strTeamBadge ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
                    }
        }
    }
    
    func setRoundedForImgCell(myImg : UIImageView){
        let saveCenter = myImg.center
        let newFrame:CGRect = CGRect(origin: CGPoint(x: myImg.frame.origin.x,y : myImg.frame.origin.y), size: CGSize(width: myImg.frame.size.width - 20, height: myImg.frame.size.height - 20))
        myImg.layer.cornerRadius = myImg.frame.height / 2.2
        myImg.frame = newFrame;
        myImg.center = saveCenter
        myImg.clipsToBounds = true
    }
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
