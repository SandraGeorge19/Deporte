//
//  FavTableViewCell.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {
    
    //MARK: -- IBOutlets
    
    @IBOutlet weak var favCellImg: UIImageView!
    @IBOutlet weak var favCellTitle: UILabel!
    
    
    //MARK: -- Propertiest
    
    var sportItem : Sport?{
        didSet{
            guard let sportItem = sportItem else{return}
            favCellImg.kf.indicatorType = .activity
            favCellImg.kf.setImage(with: URL(string: sportItem.image ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            favCellTitle.text = sportItem.title
        }
    }
    
    //MARK: -- LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setRoundedForImgCell(myImg : favCellImg)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: -- IBActions
    
    @IBAction func didPressYoutubeBtn(_ sender: Any) {
    }
    
    //MARK: -- Functions

    func setRoundedForImgCell(myImg : UIImageView){
        let saveCenter = myImg.center
        let newFrame:CGRect = CGRect(origin: CGPoint(x: myImg.frame.origin.x,y : myImg.frame.origin.y), size: CGSize(width: myImg.frame.size.width - 20, height: myImg.frame.size.height - 20))
        myImg.layer.cornerRadius = myImg.frame.height / 2
        myImg.frame = newFrame;
        myImg.center = saveCenter
        myImg.clipsToBounds = true
    }

}