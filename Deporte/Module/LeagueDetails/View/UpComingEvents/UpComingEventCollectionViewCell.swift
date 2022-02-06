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
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
