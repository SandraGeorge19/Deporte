//
//  LeaguesNetworking.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import Alamofire


enum LeaguesNetworking{
    case getAllLeaguesForSport(sportName : String)
}

extension LeaguesNetworking : TargetType{
    var baseURL: String {
        switch self {
        default:
            return Constants.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getAllLeaguesForSport(let sportName):
            return Constants.GET_ALL_LEAGUES
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllLeaguesForSport:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllLeaguesForSport(let sportName):
            return .requestParam(parameters: ["s" : sportName], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            //return ["authorization" : "token"]
            return [:]
        }
    }
    
    
}
