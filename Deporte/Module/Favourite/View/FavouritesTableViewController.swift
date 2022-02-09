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
    
    //for refreshing the data that comes from api
    let favRefreshControl = UIRefreshControl()
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
           super.viewDidLoad()

        favRefreshControl.tintColor = UIColor(displayP3Red: 161/255, green: 70/255, blue: 242/255, alpha: 0.75)
        
            startIndicator()
        favoritePresenter.attachView(favLeaguesView: self)
        refreshingFavoriteScreen()
       }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataFromCoreData()
    }
    //MARK: -- IBActions
    
    
}

