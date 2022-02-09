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
    
    func requestData(){
        leagueDetailsPresenter.requestData(leagueID: leagueDetailsPresenter.currentLeague?.idLeague ?? "", leagueName: leagueDetailsPresenter.currentLeague?.strLeague ?? "")
    }
    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    
    
    
    func updateCollectionView() {
        upComingEventsTableView.reloadData()
        latesteEventCollectionHeight.constant = CGFloat((98) * leagueDetailsPresenter.latestEvents.count)
        latestEventCollectionView.reloadData()
        teamsCollectionView.reloadData()
        detailsRefreshControl.endRefreshing()
        myIndicator.stopAnimating()
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
    
//    @objc func updateCollectionView() {
//        self.upComingEventsTableView.reloadData()
//        self.latesteEventCollectionHeight.constant = CGFloat((98) * leagueDetailsPresenter.latestEvents.count)
//        self.latestEventCollectionView.reloadData()
//        self.teamsCollectionView.reloadData()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.leagueDetailsScroll.refreshControl?.endRefreshing()
//        }
//        myIndicator.stopAnimating()
//    }
    func refreshingLeagueDetailsScreen(){
        detailsRefreshControl.addTarget(self, action: #selector(updateDataToScreen), for: .valueChanged)
        leagueDetailsScroll.refreshControl = detailsRefreshControl
    }
    
    @objc func swipeFunc(gesture : UISwipeGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
