//
//  TeamDetailsViewController.swift
//  Deporte
//
//  Created by Abdo on 2/3/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Toast_Swift

protocol TeamProtocol {
    func updatingTeamViewController()
}

class TeamDetailsViewController: UIViewController {

    
    //MARK: -- IBOutlets

    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var descriptionName: UITextView!
    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var stadiumView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    
    
    //MARK: -- Properties
    let myIndicator = UIActivityIndicatorView(style: .large)
    var teamPresenter : TeamPresenter!

    //MARK: -- LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewShadowUI(view: leagueView)
        viewShadowUI(view: stadiumView)
        viewShadowUI(view: countryView)
        viewShadowUI(view: descriptionView)

        // Do any additional setup after loading the view.
        startIndicator()
        
        initializingTeamPresenterAndGetData()
    }
    
    //MARK: -- IBActions
    @IBAction func FBBtnPressed(_ sender: UIButton) {
        let fbURL = teamPresenter.myTeam?.strFacebook
        if fbURL != nil && fbURL != ""{
            openSelectedApp(appName: "facebook", linkURL: fbURL!)
        }
        else{
            self.view.makeToast("There is No Facebook Page, Yet!")
        }
        
    }
    
    @IBAction func twitterPressed(_ sender: UIButton) {
        let twitterURL = teamPresenter.myTeam?.strTwitter
        if twitterURL != nil && twitterURL != ""{
            openSelectedApp(appName: "twitter", linkURL: twitterURL!)
        }
        else{
            self.view.makeToast("There is No Twitter Account, Yet!")
        }
    }
    
    @IBAction func instaPressed(_ sender: UIButton) {
        let instaURL = teamPresenter.myTeam?.strInstagram
        if instaURL != nil && instaURL != ""{
            openSelectedApp(appName: "instagram", linkURL: instaURL!)
        }
        else{
            self.view.makeToast("There is No Instagram Page, Yet!")
        }
    }
    @IBAction func websitePressed(_ sender: UIButton) {
        let websiteURL = teamPresenter.myTeam?.strWebsite
        if websiteURL != nil && websiteURL != ""{
            openSelectedApp(appName: "", linkURL: websiteURL!)
        }
        else{
            self.view.makeToast("There is No Website, Yet!")
        }
    }
}
