//
//  UpComingTableViewCell.swift
//  Deporte
//
//  Created by Abdo on 2/2/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class UpComingTableViewCell: UITableViewCell {

    @IBOutlet weak var upComingCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let myCell1 = UINib(nibName: "UpComingEventCollectionViewCell", bundle: nil)
        self.upComingCollectionView.register(myCell1, forCellWithReuseIdentifier: "UpComingEventCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
