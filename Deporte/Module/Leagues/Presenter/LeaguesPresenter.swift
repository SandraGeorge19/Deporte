//
//  LeaguesPresenter.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation


class LeaguesPresenter{
 
    
    var leaguesApi : LeaguesAPIProtocol!
    var myLeagues : [League] = []
    weak var leagueView : LeaguesTableViewController?
    
    init(leaguesApi : LeaguesAPIProtocol) {
        self.leaguesApi = leaguesApi
    }
    
    func attachView(leagueView : LeaguesTableViewController){
        self.leagueView = leagueView
    }
    
    func getLeaguesToTableView(){
        leaguesApi.getLeaguesFromApi (sportName: (leagueView?.sport?.strSport)!) { (result) in
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
