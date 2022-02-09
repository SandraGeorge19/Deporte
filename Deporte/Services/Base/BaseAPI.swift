//
//  BaseAPI.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T : TargetType>{
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion: @escaping (Swift.Result<M?, NSError>) -> Void){
        guard let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue) else { return }
        let headers = target.headers
        let params = buildParams(task: target.task)
        Alamofire.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else{
                //fail request and add custom error
                let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey : ErrorMessage.genericError])
                completion(.failure(error))
                return
            }
            
            if statusCode == 200{
                //successfull request
                guard let jsonResponse = response.data else {
                    //fail request and add custom error
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey : ErrorMessage.genericError])
                    completion(.failure(error))
                    return
                }
                guard let responseObject = try? JSONDecoder().decode(M.self, from: jsonResponse) else{
                    //fail request and add custom error
                   let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey : ErrorMessage.genericError])
                   completion(.failure(error))
                   return
                }
                completion(.success(responseObject))
            }else{
                let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey : ErrorMessage.genericError])
                completion(.failure(error))
            }
        }
    }
    
    private func buildParams(task: Task) -> ([String : Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParam(parameters: let parameters , encoding: let encoding):
            return (parameters, encoding)
        }
    }
}
