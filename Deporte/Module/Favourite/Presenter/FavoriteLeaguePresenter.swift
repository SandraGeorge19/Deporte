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
    var favLeaguesView : FavoriteLeaguesProtocol!
    var coreDateObj : CoreDataServices?
    
    var myFavorites : [LeagueDB] = []
    
    
    //MARK: -- Functions
    init() {
        coreDateObj = CoreDataServices(appDelegate: (UIApplication.shared.delegate) as! AppDelegate)
    }
    
    func attachView(favLeaguesView : FavoriteLeaguesProtocol){
        self.favLeaguesView = favLeaguesView
    }
    
    
    func getFavoriteLeaguesFromCoreData(){
        myFavorites = (coreDateObj?.fetchLeagues())!
        print("favourite leagues count is :\(myFavorites.count)")
        self.favLeaguesView?.updatingFavoriteTableView()
    }
}
