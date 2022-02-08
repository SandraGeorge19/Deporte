//
//  LeaguesPresenter.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation


class LeaguesPresenter{
 
    //edits sandra
    var sportName : String!
    
    
    
    
    
    var leaguesApi : LeaguesAPIProtocol!
    var myLeagues : [LeagueDB] = []
    weak var leagueView : LeaguesTableViewController?
    
    init(leaguesApi : LeaguesAPIProtocol ,sportName : String ) {
        self.leaguesApi = leaguesApi
        self.sportName = sportName
    }
    
    func attachView(leagueView : LeaguesTableViewController){
        self.leagueView = leagueView
    }
    
    func getLeaguesToTableView(){
        leaguesApi.getLeaguesFromApi (sportName: sportName) { (result) in
            DispatchQueue.main.async {
                switch result{
                    
                case .success(let response):
                    self.myLeagues = response?.countrys ?? []
                    self.leagueView?.updatingLeaguesTableView()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
