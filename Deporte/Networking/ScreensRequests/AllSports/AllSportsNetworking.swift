//
//  AllSportsNetworking.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation


enum AllSportsNetworking{
    case getAllSports
}

extension AllSportsNetworking : TargetType{
    var baseURL: String {
        switch self {
        default:
            return Constants.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getAllSports:
            return Constants.GET_ALL_SPORTS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllSports:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllSports:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
