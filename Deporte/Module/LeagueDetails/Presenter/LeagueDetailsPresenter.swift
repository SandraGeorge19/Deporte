//
//  LeagueDetailsPresenter.swift
//  Deporte
//
//  Created by Abdo on 2/5/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
class LeagueDetailsPresenter{
    var leagueDetailsViewController:LeagueDetailsViewController!
    var teamsApi : TeamsAPIProtocol!
    var eventsApi:EventsAPI!
    init(leagueDetailsViewController:LeagueDetailsViewController,
         teamsApi : TeamsAPIProtocol,
         eventsApi:EventsAPI) {
        self.eventsApi=eventsApi
        self.leagueDetailsViewController=leagueDetailsViewController
        self.teamsApi=teamsApi
    }
    
    func requestData(leagueID:String, leagueName: String){
        leagueDetailsViewController.isFavorite = CoreDataServices.isLeagueExists(leagueID: leagueID)
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        eventsApi.getEvents(leagueID:leagueID){(result) in
            switch result{
            case .success(let response):
                print("Sucess upcom")
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                dateFormatter.dateFormat = "yyyy-MM-dd"
                self.leagueDetailsViewController.upComingEvents = (response?.events.filter{ (event) in
                    event.dateEvent?.getDateFromString(dateFormatter: DateFormatter.getDateFormatterYYYY_MM_DD()).hasNotStarted() ?? false
                    } ?? [])
                self.leagueDetailsViewController.latestEvents = (response?.events.filter{ (event) in
                event.dateEvent?.getDateFromString(dateFormatter: DateFormatter.getDateFormatterYYYY_MM_DD()).hasEnded() ?? false
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
