//
//  LatestEventsAPI.swift
//  Deporte
//
//  Created by Abdo on 2/5/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

protocol LatestEventsAPI {
    func getLatestEvents(leagueID:String,completion: @escaping (Swift.Result<(EventResponse?), NSError>) -> Void)
    
}

class LatestEventsAPIImpl : BaseAPI<LatestEventsNetworking>, LatestEventsAPI{
    func getLatestEvents(leagueID:String,completion: @escaping (Swift.Result<(EventResponse?), NSError>) -> Void) {
        self.fetchData(target: .getLatestEvent(leagueID: leagueID), responseClass: EventResponse.self) { (result) in
            completion(result)
        }
    }
    
}
