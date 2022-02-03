//
//  AllSportsAPI.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation


protocol AllSportsAPIProtocol {
    func getAllSportsFromApi(completion: @escaping (Swift.Result<(AllSports?), NSError>) -> Void)
}

class AllSportsAPI : BaseAPI<AllSportsNetworking> , AllSportsAPIProtocol{
    //MARK: --Requests
    
    func getAllSportsFromApi(completion: @escaping (Swift.Result<(AllSports?), NSError>) -> Void){
        self.fetchData(target: .getAllSports, responseClass: AllSports.self) { (result) in
            completion(result)
        }
    }
}
