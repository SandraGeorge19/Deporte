//
//  LeaguesTableViewController.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire



protocol LeaguesProtocol {
    func updatingLeaguesTableView()
}
class LeaguesTableViewController: UITableViewController , LeaguesProtocol{
    
    
    //MARK: -- IBOutlets
    
    
    //MARK: -- Propertiest
    let myIndicator = UIActivityIndicatorView(style: .large)
    var leaguesPresenter : LeaguesPresenter!
    
    let leagueRefreshControl = UIRefreshControl()
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = leaguesPresenter.sportName
        
        leagueRefreshControl.tintColor = UIColor(displayP3Red: 161/255, green: 70/255, blue: 242/255, alpha: 0.75)
        
        startIndicator()
        
        initializeLeaguesPresenterAndGetData()
        refreshingLeaguesScreen()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    //MARK: -- IBActions
    
    
}
