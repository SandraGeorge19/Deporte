//
//  FavVCExtention+Functions.swift
//  Deporte
//
//  Created by sandra on 2/9/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit

extension FavouritesTableViewController{
    
    //MARK: -- Functions
    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    
    func getDataFromCoreData(){
        favoritePresenter.getFavoriteLeaguesFromCoreData()
    }
    
    @objc func updatingFavoriteTableView() {
        self.tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.refreshControl?.endRefreshing()
        }
        myIndicator.stopAnimating()
    }
    func refreshingFavoriteScreen(){
        favRefreshControl.addTarget(self, action: #selector(updatingFavoriteTableView), for: .valueChanged)
        tableView.refreshControl = favRefreshControl
    }
    
    func navigateToLeagueDetails(destinationLeague: LeagueDB) {
        let leagueDetVC = self.storyboard?.instantiateViewController(withIdentifier: "LatestEvent2ViewController") as! LeagueDetailsViewController
        leagueDetVC.leagueDetailsPresenter.currentLeague = destinationLeague.convertToLeague()
        
        //for delegation
        //leagueDetVc.fav = self
        
        self.present(leagueDetVC, animated: true, completion: nil)
    }
}
