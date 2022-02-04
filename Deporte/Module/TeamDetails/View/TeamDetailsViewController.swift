//
//  TeamDetailsViewController.swift
//  Deporte
//
//  Created by Abdo on 2/3/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

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
        openSelectedApp(appName: "facebook", linkURL: teamPresenter.myTeam?.strFacebook ?? "")
    }
    
    @IBAction func twitterPressed(_ sender: UIButton) {
        openSelectedApp(appName: "twitter", linkURL: teamPresenter.myTeam?.strTwitter ?? "")
    }
    
    @IBAction func instaPressed(_ sender: UIButton) {
        openSelectedApp(appName: "instagram", linkURL: teamPresenter.myTeam?.strInstagram ?? "")
    }
    @IBAction func websitePressed(_ sender: UIButton) {
        openSelectedApp(appName: "", linkURL: teamPresenter.myTeam?.strWebsite ?? "")
    }
    
    
    

}
