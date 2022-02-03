//
//  TeamsTableViewCell.swift
//  Deporte
//
//  Created by Abdo on 2/2/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let myCell1 = UINib(nibName: "TeamCollectionViewCell", bundle: nil)
        self.teamsCollectionView.register(myCell1, forCellWithReuseIdentifier: "TeamCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
