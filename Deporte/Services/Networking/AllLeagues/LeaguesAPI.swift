//
//  LeaguesAPI.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation


protocol LeaguesAPIProtocol {
    func getLeaguesFromApi(sportName : String, completion: @escaping (Swift.Result<(AllLeagues?), NSError>) -> Void)
    
}

class LeaguesAPI : BaseAPI<LeaguesNetworking>, LeaguesAPIProtocol{
    func getLeaguesFromApi(sportName : String, completion: @escaping (Swift.Result<(AllLeagues?), NSError>) -> Void) {
        self.fetchData(target: .getAllLeaguesForSport(sportName: sportName ), responseClass: AllLeagues.self) { (result) in
            completion(result)
        }
    }
    
}
