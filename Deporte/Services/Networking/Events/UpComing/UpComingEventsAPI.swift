//
//  UpComingAPI.swift
//  Deporte
//
//  Created by Abdo on 2/5/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

protocol UpComingEventsAPI {
    func getAllUpComingEvents(completion: @escaping (Swift.Result<(EventResponse?), NSError>) -> Void)
    
}

class UpComingEventsAPIImpl : BaseAPI<UpComingEventsNetworking>, UpComingEventsAPI{
    func getAllUpComingEvents(completion: @escaping (Swift.Result<(EventResponse?), NSError>) -> Void) {
        self.fetchData(target: .getUpComingEvents, responseClass: EventResponse.self) { (result) in
            completion(result)
        }
    }
    
}
