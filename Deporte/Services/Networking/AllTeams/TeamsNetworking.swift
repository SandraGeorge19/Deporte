//
//  TeamsNetworking.swift
//  Deporte
//
//  Created by sandra on 2/4/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import Alamofire


enum TeamsNetworking{
    case getAllTeamsForLeague(leageName : String)
}

extension TeamsNetworking : TargetType{
    var baseURL: String {
        switch self {
        default:
            return Constants.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getAllTeamsForLeague(let leageName):
            return Constants.GET_TEAM_DETAILS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllTeamsForLeague:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllTeamsForLeague(let leagueName):
            return .requestParam(parameters: ["l" : leagueName], encoding: URLEncoding.default)
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
