//
//  LeagueDetailsPresenter.swift
//  Deporte
//
//  Created by Abdo on 2/5/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

class LeageDetailsPresenter{
    var leagueDetailsViewController:LeagueDetailsViewController!
    var teamsApi : TeamsAPIProtocol!
    var latestEventsApi:LatestEventsAPI!
    var upComingEventsApi:UpComingEventsAPI!
    init(leagueDetailsViewController:LeagueDetailsViewController,
         teamsApi : TeamsAPIProtocol,
         latestEventsApi:LatestEventsAPI,
         upComingEventsApi:UpComingEventsAPI) {
        self.latestEventsApi=latestEventsApi
        self.leagueDetailsViewController=leagueDetailsViewController
        self.teamsApi=teamsApi
        self.upComingEventsApi=upComingEventsApi
    }
    
    func requestData(leagueID:String, leagueName: String){
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        upComingEventsApi.getAllUpComingEvents(){(result) in
            switch result{
                case .success(let response):
                    self.leagueDetailsViewController.upComingEvents = (response?.event ?? [])
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    
                    break
                
            }
            dispatchGroup.leave()
        
        }
    }
    


      private func getHomeDataWithDispatchGroup() {
          


//
//          /// `Notify Main thread`
//          dispatchGroup.notify(queue: .main) {
//              self.isLoading = true
//          }
      }
}
