//
//  LeaguesVCExtensionFunctions.swift
//  Deporte
//
//  Created by sandra on 2/9/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesTableViewController{
    
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
    
    @objc func updatingLeaguesTableView() {
        self.tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.refreshControl?.endRefreshing()
        }
        myIndicator.stopAnimating()
    }
    func refreshingLeaguesScreen(){
        leagueRefreshControl.addTarget(self, action: #selector(updatingLeaguesTableView), for: .valueChanged)
        tableView.refreshControl = leagueRefreshControl
    }
    
}
