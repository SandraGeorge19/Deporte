//
//  TeamsPresenter.swift
//  Deporte
//
//  Created by sandra on 2/4/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

class TeamsPresenter{
    var leagueName : String!
    
    var teamsApi : TeamsAPIProtocol!
    var myTeams : [Team] = []
    weak var teamsSubView : LatestEvent2ViewController?
    
    init(teamsApi : TeamsAPIProtocol , leagueName : String){
        self.teamsApi = teamsApi
        self.leagueName = leagueName
    }
    
    func attachView(teamsView : LatestEvent2ViewController){
        self.teamsSubView = teamsView
    }
    func getTeamsToTeamsCollectionView(){
        teamsApi.getTeamsFromApi(leagueName: leagueName) { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let response):
                    self.myTeams = response?.teams ?? []
                    self.teamsSubView?.updatingTeamsCollectionView()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
