//
//  LatestEventsTableViewCell.swift
//  Deporte
//
//  Created by Abdo on 2/2/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class LatestEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var latestEventsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let myCell1 = UINib(nibName: "LatestEventCollectionViewCell", bundle: nil)
        self.latestEventsCollectionView.register(myCell1, forCellWithReuseIdentifier: "LatestEventCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
