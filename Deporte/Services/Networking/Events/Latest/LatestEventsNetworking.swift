//
//  LatestEventsNetworking.swift
//  Deporte
//
//  Created by Abdo on 2/5/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import Alamofire

enum LatestEventsNetworking{
    case getLatestEvent(leagueID:String)
}

extension LatestEventsNetworking : TargetType{
    var baseURL: String {
        switch self {
        default:
            return Constants.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getLatestEvent:
            return Constants.GET_LATEST_EVENT
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLatestEvent:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getLatestEvent(let leagueID):
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
