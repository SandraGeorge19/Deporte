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
    func navigateToLeagueDetails()
}

class FavouritesTableViewController: UITableViewController {
    
    //MARK: -- IBOutlets
    
    
    //MARK: -- Propertiest
    let myIndicator = UIActivityIndicatorView(style: .large)
    var favoritePresenter : FavoriteLeaguePresenter!
    
    //let refreshControl = UIRefreshControl()
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
           super.viewDidLoad()

           // Uncomment the following line to preserve selection between presentations
           // self.clearsSelectionOnViewWillAppear = false

           // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
            startIndicator()
       }
    
    
    //MARK: -- IBActions
    
    //MARK: -- Functions

    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    
    func getDataFromCoreData(){
        favoritePresenter.attachView(favLeagueViewController: self)
        favoritePresenter.getFavoriteLeaguesFromCoreData()
    }
   
}

