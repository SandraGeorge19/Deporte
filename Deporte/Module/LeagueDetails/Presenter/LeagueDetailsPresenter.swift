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
        upComingEventsApi.getAllUpComingEvents(leagueID:leagueID){(result) in
            switch result{
            case .success(let response):
                print("Sucess upcom")
                self.leagueDetailsViewController.upComingEvents = (response?.events.filter{ (event) in
//                    event.dateEvent?.getDateFromString(dateFormatter: DateFormatter.getDateFormatterYYYY_MM_DD()).hasEnded() as! Bool
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let date=dateFormatter.date(from:event.dateEvent ?? "")!
                    return !date.hasEnded()
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
