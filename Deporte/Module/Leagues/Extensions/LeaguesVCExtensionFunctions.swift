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
    }
    
    @objc func updatingLeaguesTableView() {
        self.tableView.backgroundView = nil
        self.tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.refreshControl?.endRefreshing()
        }
        myIndicator.stopAnimating()
    }

    @objc func requestData(){
        if NetworkMonitor.shared.isConnected {
            leaguesPresenter.getLeaguesToTableView()
        }else{
            noConnection()
        }
    }
    
    func noConnection(){
        if leaguesPresenter.myLeagues.count<1 {
            setBackgroundNoConnection()
        }
        myIndicator.stopAnimating()
        DispatchQueue.main.async {
            self.alertNoNetworkPresent()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.refreshControl?.endRefreshing()
        }
    }
    func setBackgroundNoConnection(){
        let noConnectionImageView : UIImageView = {
            let iv = UIImageView()
            iv.image = UIImage(named:"noConnection.png")
            iv.contentMode = .scaleAspectFit
            return iv
        }()
        self.tableView.backgroundView = noConnectionImageView
    }
    func refreshingLeaguesScreen(){
        leagueRefreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        tableView.refreshControl = leagueRefreshControl
    }
    
}
