//
//  LeaguesTableViewCell.swift
//  Deporte
//
//  Created by sandra on 1/29/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Toast_Swift

class LeaguesTableViewCell: UITableViewCell {
    
    //MARK: -- IBOutlets
    
    @IBOutlet weak var leagueCellImg: UIImageView!
    @IBOutlet weak var leagueCellTitle: UILabel!
    
    //MARK: -- Propertiest
    
    var leagueCell : LeagueDB?{
        didSet{
            guard let leagueCell = leagueCell else{return}
            leagueCellImg.kf.indicatorType = .activity
            leagueCellImg.kf.setImage(with: URL(string: leagueCell.strBadge ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            leagueCellTitle.text = leagueCell.strLeague
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
        print(leagueCell?.strYoutube ?? "")
        let youtubeURL = leagueCell?.strYoutube
        DispatchQueue.main.async {
            if youtubeURL != nil && youtubeURL != ""{
                self.openApp()
            }else{
                self.makeToast("There is no Youtube Channel,Yet!")
            }
        }
        
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
    
    func openApp() {

        let appName = "youtube"
        let appScheme = "\(appName)://app"
        let appUrl = URL(string: appScheme)

        if UIApplication.shared.canOpenURL(appUrl! as URL) {
            UIApplication.shared.open(appUrl!)
        } else {
            UIApplication.shared.open(URL(string: ("https://\(self.leagueCell?.strYoutube ?? "")"))!, options: [:], completionHandler: nil)
        }

    }

}
