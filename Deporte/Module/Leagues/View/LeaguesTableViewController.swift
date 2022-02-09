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
    
    
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Leagues"
        startIndicator()
        
        initializeLeaguesPresenterAndGetData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    //MARK: -- IBActions
    
    //MARK: -- Functions

    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    
    func initializeLeaguesPresenterAndGetData(){
        leaguesPresenter.attachView(leagueView: self)
        leaguesPresenter.getLeaguesToTableView()
    }
    
    func updatingLeaguesTableView() {
        self.tableView.reloadData()
        myIndicator.stopAnimating()
    }
    
    
}
