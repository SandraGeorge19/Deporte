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
    func initializeHomePresenterAndGetData(){
        homePresenter = HomePresenter(sportsApi: AllSportsAPI())
        homePresenter.attachView(homeView: self)
        homePresenter.getAllSports()
    }
    
    @objc func updatingCollectionView() {
        self.myCollectionView.reloadData()
        self.myCollectionView.refreshControl?.endRefreshing()
        myIndicator.stopAnimating()
    }
    
    func alertWillPresent(){
        let alert = UIAlertController(title: "Network Error!!", message: "The device isn't connected to network, please re-check the internet connectivity", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkConnectivity(){
        if NetworkMonitor.shared.isConnected{
            internetMsgLbl.isHidden = true
            myCollectionView.isHidden = false
            initializeHomePresenterAndGetData()
        }else{
            internetMsgLbl.isHidden = false
            myCollectionView.isHidden = true
            alertWillPresent()
            
        }
    }
    
    func refreshingHomeScreen(){
        refreshControl.addTarget(self, action: #selector(updatingCollectionView), for: .valueChanged)
        myCollectionView.refreshControl = refreshControl
    }
}