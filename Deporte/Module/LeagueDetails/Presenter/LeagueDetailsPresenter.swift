//
//  LeagueDetailsPresenter.swift
//  Deporte
//
//  Created by Abdo on 2/5/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

<<<<<<< HEAD
class LeageDetailsPresenter{
    
    
    var leagueName : String!
    
=======
class LeagueDetailsPresenter{
    var leagueDetailsViewController:LeagueDetailsViewController!
>>>>>>> main
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
<<<<<<< HEAD
                case .success(let response):
                    self.leagueDetailsViewController?.upComingEvents = (response?.event ?? [])
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    
                    break
=======
            case .success(let response):
                print("Sucess upcom")
                self.leagueDetailsViewController.upComingEvents = (response?.event.filter{ (event) in
                    event.idLeague==leagueID
                    } ?? [])
                break
            case .failure(let error):
                print("fail upcoming")
                print(error.domain)
                
                break
                
            }
            dispatchGroup.leave()
            
        }
        dispatchGroup.enter()
        latestEventsApi.getLatestEvents(leagueID: leagueID){(result) in
            switch result{
            case .success(let response):
                print("Sucess latest \(String(describing: response?.events.count))")
                self.leagueDetailsViewController.latestEvents = (response?.events ?? [])
                break
            case .failure(let error):
                print("fail larest")
                print(error.code)
                break
>>>>>>> main
                
            }
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        teamsApi.getTeamsFromApi(leagueName: leagueName) { (result) in
            switch result{
            case .success(let response):
                print("Sucess \(String(describing: response?.teams.count) )")
                self.leagueDetailsViewController.myTeams = (response?.teams ?? [])
                break
            case .failure(let error):
                print("fail teams")
                print(error.domain)
            }
            dispatchGroup.leave()
        }
    
        dispatchGroup.notify(queue: .main){
            print("notify")
            self.leagueDetailsViewController.updateCollectionView()
        }
    }
    
    

}
