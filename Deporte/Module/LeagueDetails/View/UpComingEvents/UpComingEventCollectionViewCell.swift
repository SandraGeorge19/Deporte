//
//  UpComingEventCollectionViewCell.swift
//  Deporte
//
//  Created by Abdo on 2/2/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class UpComingEventCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    var event:Event?
    var teams:[Team] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setUpView(){
        awayTeamLabel.text = event?.strAwayTeam ?? ""
        homeTeamLabel.text = event?.strHomeTeam ?? ""
        roundLabel.text = "Week \(event?.intRound ?? "")"
        timeLabel.text = "\(event?.strTime?.prefix(5) ?? "")"
        dateLabel.text = event?.dateEvent?.getDateDayAsNumberAndMonthAsString()
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
