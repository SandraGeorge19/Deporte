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

        
    }
    func setUpView() {
        awayTeamNameLabel.text = event?.strAwayTeam ?? ""
        homeTeamNameLabel.text = event?.strHomeTeam ?? ""
        resultLabel.text = "\(String(describing: event?.intAwayScore ?? "")):\(String(describing: event?.intHomeScore ?? ""))"
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

}
