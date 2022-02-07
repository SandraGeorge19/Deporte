//
//  EventsAPI.swift
//  Deporte
//
//  Created by Abdo on 2/7/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
protocol EventsAPI {
    func getEvents(leagueID:String,completion: @escaping (Swift.Result<(EventResponse?), NSError>) -> Void)
    
}

class EventsAPIImpl : BaseAPI<EventsNetworking>, EventsAPI{
    func getEvents(leagueID:String,completion: @escaping (Swift.Result<(EventResponse?), NSError>) -> Void) {
        self.fetchData(target: .getEvents(leagueID: leagueID), responseClass: EventResponse.self) { (result) in
            completion(result)
        }
    }
    
}
