//
//  EventsNetworking.swift
//  Deporte
//
//  Created by Abdo on 2/7/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import Alamofire

enum EventsNetworking{
    case getEvents(leagueID:String)
}

extension EventsNetworking : TargetType{
    var baseURL: String {
        switch self {
        default:
            return Constants.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getEvents:
            return Constants.GET_EVENTS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getEvents:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getEvents(let leagueID):
            return .requestParam(parameters: ["id" : leagueID], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}
