//
//  FavouritesTableViewController.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Alamofire

protocol FavoriteLeaguesProtocol {
    func updatingFavoriteTableView()
    func navigateToLeagueDetails(destinationLeague : LeagueDB)
}

class FavouritesTableViewController: UITableViewController , FavoriteLeaguesProtocol{
    
    //MARK: -- IBOutlets
    
    
    //MARK: -- Propertiest
    let myIndicator = UIActivityIndicatorView(style: .large)
    var favoritePresenter = FavoriteLeaguePresenter()
    
    //let refreshControl = UIRefreshControl()
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
           super.viewDidLoad()

            startIndicator()
        favoritePresenter.attachView(favLeagueViewController: self)
        //getDataFromCoreData()
       }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataFromCoreData()
    }
    //MARK: -- IBActions
    
    //MARK: -- Functions
    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    
    func getDataFromCoreData(){
        favoritePresenter.getFavoriteLeaguesFromCoreData()
    }
    
    func updatingFavoriteTableView() {
        self.tableView.reloadData()
        myIndicator.stopAnimating()
    }
    
    func navigateToLeagueDetails(destinationLeague: LeagueDB) {
        let leagueDetVC = self.storyboard?.instantiateViewController(withIdentifier: "LatestEvent2ViewController") as! LeagueDetailsViewController
        leagueDetVC.currentLeague = destinationLeague.convertToLeague()
        
        //for delegation
        //leagueDetVc.fav = self
        
        self.present(leagueDetVC, animated: true, completion: nil)
    }
   
}

