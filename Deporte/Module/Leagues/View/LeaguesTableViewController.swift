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
    var sport : MySport?
    
    //var leagues : [MySport]!
    
    
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //tableView.reloadData()
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
        leaguesPresenter = LeaguesPresenter(leaguesApi: LeaguesAPI())
        leaguesPresenter.attachView(leagueView: self)
        leaguesPresenter.getLeaguesToTableView()
    }
    
    func updatingLeaguesTableView() {
        self.tableView.reloadData()
        myIndicator.stopAnimating()
    }
    
    
}
