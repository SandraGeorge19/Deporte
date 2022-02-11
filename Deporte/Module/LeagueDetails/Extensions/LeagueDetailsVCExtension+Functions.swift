//
//  LeagueDetailsVCExtension+Functions.swift
//  Deporte
//
//  Created by sandra on 2/8/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit

extension LeagueDetailsViewController{
    
    
    //MARK: --Functions
    
    func checkingIsFavorite(){
        isFavorite = leagueDetailsPresenter.coreData?.isLeagueExists(leagueID : leagueDetailsPresenter.currentLeague?.idLeague ?? "") ?? false
        if isFavorite{
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else{
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    func configureViewControllersDelegations(){
        
        teamsCollectionView.dataSource=self
        teamsCollectionView.delegate=self
        latestEventCollectionView.dataSource=self
        latestEventCollectionView.delegate=self
        upComingEventsTableView.delegate=self
        upComingEventsTableView.dataSource=self
        let myCell1 = UINib(nibName: "UpComingEventCollectionViewCell", bundle: nil)
        upComingEventsTableView.register(myCell1, forCellWithReuseIdentifier: "UpComingEventCollectionViewCell")
        let myCell2 = UINib(nibName: "LatestEventCollectionViewCell", bundle: nil)
        latestEventCollectionView.register(myCell2, forCellWithReuseIdentifier: "LatestEventCollectionViewCell")
        let myCell3 = UINib(nibName: "TeamCollectionViewCell", bundle: nil)
        teamsCollectionView.register(myCell3, forCellWithReuseIdentifier: "TeamCollectionViewCell")
        latesteEventCollectionHeight.constant = (98 + 16) * 5
        // Do any additional setup after loading the view.
    }
    
    @objc func requestData(){
        if NetworkMonitor.shared.isConnected{
            leagueDetailsPresenter.requestData(leagueID: leagueDetailsPresenter.currentLeague?.idLeague ?? "", leagueName: leagueDetailsPresenter.currentLeague?.strLeague ?? "")
        }else{
            noConnection()
        }
    }
    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    
    
    
    func updateCollectionView() {
        if leagueDetailsPresenter.upComingEvents.count == 0{
            let imageView : UIImageView = {
                let iv = UIImageView()
                iv.image = UIImage(named:"noData.png")
                iv.contentMode = .scaleAspectFill
                return iv
            }()
            upComingEventsTableView.backgroundView=imageView
        }
        
        setViewVisible()
        
        imageViewProblem.isHidden = true
        
        upComingEventsTableView.reloadData()
        
        latesteEventCollectionHeight.constant = CGFloat(((108) * leagueDetailsPresenter.latestEvents.count)+16)
        latestEventCollectionView.reloadData()
        teamsCollectionView.reloadData()
        detailsRefreshControl.endRefreshing()
        myIndicator.stopAnimating()
        if leagueDetailsPresenter.latestEvents.count == 0{
            let imageView : UIImageView = {
                let iv = UIImageView()
                iv.image = UIImage(named:"noData.png")
                iv.contentMode = .scaleAspectFill
                return iv
            }()
            latesteEventCollectionHeight.constant=230
            latestEventCollectionView.backgroundView=imageView
        }
    }
    
    func addingSwipe(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action:
            #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    @objc func updateDataToScreen(){
        guard let leagueId = leagueDetailsPresenter.currentLeague?.idLeague , let leagueName = leagueDetailsPresenter.currentLeague?.strLeague  else {
            return
        }
        leagueDetailsPresenter.requestData(leagueID: leagueId, leagueName: leagueName)
    }
//    @objc func requestData(){
//        if NetworkMonitor.shared.isConnected{
//            homePresenter.getAllSports()
//        }else{
//            noConnection()
//        }
//    }
    func noConnection(){
        if (leagueDetailsPresenter.upComingEvents.count + leagueDetailsPresenter.myTeams.count + leagueDetailsPresenter.latestEvents.count) < 1 {
            setViewHidden()
            imageViewProblem.isHidden=false
        }
        DispatchQueue.main.async {
            self.alertNoNetworkPresent()
            self.myIndicator.stopAnimating()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.detailsRefreshControl.endRefreshing()
        }
        
    }
    
    func refreshingLeagueDetailsScreen(){
        detailsRefreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        leagueDetailsScroll.refreshControl = detailsRefreshControl
    }
    func setViewHidden(){
        favoriteButton.isHidden=true
        teamsCollectionView.isHidden=true
        latestEventCollectionView.isHidden=true
        upComingEventsTableView.isHidden=true
        label1.isHidden=true
        label2.isHidden=true
        label3.isHidden=true
    }
    func setViewVisible(){
        favoriteButton.isHidden=false
        teamsCollectionView.isHidden=false
        latestEventCollectionView.isHidden=false
        upComingEventsTableView.isHidden=false
        label1.isHidden=false
        label2.isHidden=false
        label3.isHidden=false
    }
    @objc func swipeFunc(gesture : UISwipeGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
