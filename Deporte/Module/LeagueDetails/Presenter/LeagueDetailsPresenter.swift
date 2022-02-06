//
//  LeagueDetailsPresenter.swift
//  Deporte
//
//  Created by Abdo on 2/5/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

class LeageDetailsPresenter{
    
    
    var leagueName : String!
    
    var teamsApi : TeamsAPIProtocol!
    var myTeams : [Team] = []
    weak var leagueDetailsViewController : LeagueDetailsViewController?

    
    
    var latestEventsApi:LatestEventsAPI!
    var upComingEventsApi:UpComingEventsAPI!
    init(leagueName : String, leagueDetailsViewController:LeagueDetailsViewController,
         teamsApi : TeamsAPIProtocol,
         latestEventsApi:LatestEventsAPI,
         upComingEventsApi:UpComingEventsAPI) {
        self.leagueName = leagueName
        self.latestEventsApi=latestEventsApi
        self.leagueDetailsViewController=leagueDetailsViewController
        self.teamsApi=teamsApi
        self.upComingEventsApi=upComingEventsApi
    }
    func attachView (leagueDetailsViewController : LeagueDetailsViewController){
        self.leagueDetailsViewController = leagueDetailsViewController
    }
    
    //fetching all teams for specific league from API
    func getTeamsToTeamsCollectionView(){
        teamsApi.getTeamsFromApi(leagueName: leagueName) { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let response):
                    self.myTeams = response?.teams ?? []
                    self.leagueDetailsViewController?.updatingTeamsCollectionView()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func requestData(leagueID:String, leagueName: String){
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        upComingEventsApi.getAllUpComingEvents(){(result) in
            switch result{
                case .success(let response):
                    self.leagueDetailsViewController?.upComingEvents = (response?.event ?? [])
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
