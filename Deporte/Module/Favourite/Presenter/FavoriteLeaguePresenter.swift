//
//  FavoriteLeaguePresenter.swift
//  Deporte
//
//  Created by sandra on 2/8/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation


class FavoriteLeaguePresenter{
    
    //MARK: -- Properties
    weak var favLeagueViewController : FavouritesTableViewController?
    //var coreDateObj : CoreDataServices?
    
    var myFavorites : [LeagueDB] = []
    
    
    //MARK: -- Functions
    
    func attachView(favLeagueViewController : FavouritesTableViewController){
        self.favLeagueViewController = favLeagueViewController
    }
    
    func getFavoriteLeaguesFromCoreData(){
        myFavorites = CoreDataServices.fetchLeagues()
       // self.favLeagueViewController
    }
}
