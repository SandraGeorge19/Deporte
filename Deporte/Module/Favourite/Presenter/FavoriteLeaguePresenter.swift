//
//  FavoriteLeaguePresenter.swift
//  Deporte
//
//  Created by sandra on 2/8/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit

class FavoriteLeaguePresenter{
    
    //MARK: -- Properties
    weak var favLeagueViewController : FavouritesTableViewController?
    var coreDateObj : CoreDataServices?
    
    var myFavorites : [LeagueDB] = []
    
    
    //MARK: -- Functions
    init() {
        coreDateObj = CoreDataServices(appDelegate: (UIApplication.shared.delegate) as! AppDelegate)
    }
    
    func attachView(favLeagueViewController : FavouritesTableViewController){
        self.favLeagueViewController = favLeagueViewController
    }
    
    
    func getFavoriteLeaguesFromCoreData(){
        myFavorites = (coreDateObj?.fetchLeagues())!
        print("favourite leagues count is :\(myFavorites.count)")
        self.favLeagueViewController?.updatingFavoriteTableView()
    }
}
