//
//  LeaguesTableViewCell.swift
//  Deporte
//
//  Created by sandra on 1/29/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {
    
    //MARK: -- IBOutlets
    
    @IBOutlet weak var leagueCellImg: UIImageView!
    @IBOutlet weak var leagueCellTitle: UILabel!
    
    //MARK: -- Propertiest
    
    var sportItem : MySport?{
        didSet{
            guard let sportItem = sportItem else{return}
            leagueCellImg.kf.indicatorType = .activity
            leagueCellImg.kf.setImage(with: URL(string: sportItem.strSportThumb ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            leagueCellTitle.text = sportItem.strSport
        }
    }
    
    //MARK: -- LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setRoundedForImgCell(myImg : leagueCellImg)
        viewCellUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: -- IBActions
    
    @IBAction func didPressYoutubeBtn(_ sender: UIButton) {
        print("Hello From Youtube")
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
    func viewCellUI(){
        self.layer.shadowColor = UIColor.lightGray.cgColor
        //for actual cell
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        self.clipsToBounds = false
        self.contentView.layer.masksToBounds = true
    }

}
