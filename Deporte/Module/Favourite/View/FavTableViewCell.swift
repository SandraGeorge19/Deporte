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
    
    var favCell : LeagueDB?{
        didSet{
            guard let favCell = favCell else{return}
            favCellImg.kf.indicatorType = .activity
            favCellImg.kf.setImage(with: URL(string: favCell.strBadge ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            favCellTitle.text = favCell.strLeague
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
        viewCellUI()
    }
    
    //MARK: -- IBActions
    
    @IBAction func didPressYoutubeBtn(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: ("https://www.youtube.com/channel/UC3Guly6AbOr3PqrZMaV6vog"))!, options: [:], completionHandler: nil)
    }
    
    //MARK: -- Functions
    
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
