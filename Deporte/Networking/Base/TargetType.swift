//
//  TargetType.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import Alamofire


enum HTTPMethod : String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task{
    case requestPlain
    case requestParam(parameters: [String : Any], encoding: ParameterEncoding)
}

protocol TargetType{
    var baseURL : String{ get}
    var path: String{ get}
    var method: HTTPMethod {get}
    var task: Task { get }
    var headers: [String : String]? {get}
}
