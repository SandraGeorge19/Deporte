//
//  TeamsAPI.swift
//  Deporte
//
//  Created by sandra on 2/4/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

protocol TeamsAPIProtocol {
    func getTeamsFromApi(leagueName : String, completion: @escaping (Swift.Result<(AllTeams?), NSError>) -> Void)
    
}

class TeamsAPI : BaseAPI<TeamsNetworking>, TeamsAPIProtocol{
    func getTeamsFromApi(leagueName : String, completion: @escaping (Swift.Result<(AllTeams?), NSError>) -> Void) {
        self.fetchData(target: .getAllTeamsForLeague(leageName: leagueName), responseClass: AllTeams.self) { (result) in
            completion(result)
        }
    }
    
}
