//
//  HomePresenter.swift
//  Deporte
//
//  Created by sandra on 1/31/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

class HomePresenter{
    
    
    //MARK: -- Properties
    //var networkService : NetworkServices!
    var sportsApi : AllSportsAPIProtocol!
    var mysports : [MySport] = []
    weak var homeView : HomeProtocol!
    
//    init(networkService : NetworkServices){
//        self.networkService = networkService
//    }
    
    init(sportsApi : AllSportsAPIProtocol){
        self.sportsApi = sportsApi
    }
    
    func attachView(homeView : HomeProtocol){
        self.homeView = homeView
    }
    
    func getAllSports(){
        sportsApi.getAllSportsFromApi { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let response):
                    self.mysports = response?.sports ?? []
                    self.homeView.updatingCollectionView()
                case .failure(let error):
                    //print(error.localizedDescription)
                    self.homeView.alertWillPresent()
                }
            }
        }
        
//        networkService.fetchAllSportsData { (result) in
//            DispatchQueue.main.async {
//                switch result{
//                case .success(let sport):
//                    DispatchQueue.main.async {
//                        self.mysports = sport?.sports ?? []
//                        self.homeView.updatingCollectionView()
//                    }
//                case .failure(_):
//                    print("ERROR")
//                }
//
//            }
//        }
        
        func selectRow(index : Int){
            let sport = mysports[index]
            
        }
    }
}
