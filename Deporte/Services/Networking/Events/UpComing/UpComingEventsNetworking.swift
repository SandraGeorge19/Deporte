//
//  TeamsNetworking.swift
//  Deporte
//
//  Created by sandra on 2/4/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import Alamofire


enum UpComingEventsNetworking{
    case getUpComingEvents
}

extension UpComingEventsNetworking : TargetType{
    var baseURL: String {
        switch self {
        default:
            return Constants.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getUpComingEvents:
            return Constants.GET_UPCOMING_EVENTS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUpComingEvents:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getUpComingEvents:
            return .requestParam(parameters: ["e" : ""], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
