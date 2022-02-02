//
//  NetworkServices.swift
//  Deporte
//
//  Created by sandra on 1/31/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import Alamofire

//enum EndPoints : String{
//    case allSports = "all_sports.php"
//    case allLeagues = "all_leagues.php"
//}
//
//class NetworkServices{
//    private let baseURL = "https://www.thesportsdb.com/api/v1/json/2/"
//    func fetchAllSportsData(complitionHandler : @escaping (Swift.Result<(AllSports?), NSError>) -> Void){
//        let url = URL(string: baseURL + EndPoints.allSports.rawValue)
//            Alamofire.request(url!).responseJSON { (response) in
//                guard let statusCode = response.response?.statusCode else {return}
//                print(statusCode)
//                if statusCode == 200{
//                    guard let result = response.data else{return}
//                    guard let jsonResopnse = try? JSONDecoder().decode(AllSports.self, from: result) else{return}
//                    complitionHandler(.success(jsonResopnse))
//                }
//                
//            }
//        }
//}
//    
