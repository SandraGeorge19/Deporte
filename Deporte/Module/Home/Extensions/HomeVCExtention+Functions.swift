//
//  HomeVCExtention+Functions.swift
//  Deporte
//
//  Created by sandra on 2/3/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit

extension HomeSportsViewController{
    //MARK: -- Functions
    
    func configureCollectionView(){
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    func initializeHomePresenter(){
        homePresenter = HomePresenter(sportsApi: AllSportsAPI())
        homePresenter.attachView(homeView: self)
    }
    
    @objc func updatingCollectionView() {
        self.myCollectionView.backgroundView = nil
        self.myCollectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.myCollectionView.refreshControl?.endRefreshing()
        }
        self.myIndicator.stopAnimating()
    }
    


    @objc func requestData(){
        if NetworkMonitor.shared.isConnected{
            homePresenter.getAllSports()
        }else{
            noConnection()
        }
    }
    func noConnection(){
        if homePresenter.mysports.count < 1 {
            myCollectionView.setBackgroundNoNetwork()
        }
        myIndicator.stopAnimating()
        DispatchQueue.main.async {
            self.alertNoNetworkPresent()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.myCollectionView.refreshControl?.endRefreshing()
        }
    }
    
    func refreshingHomeScreen(){
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        myCollectionView.refreshControl = refreshControl
    }
}
