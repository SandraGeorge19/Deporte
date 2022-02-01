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
    var networkService : NetworkServices!
    var mysports : [MySport] = []
    weak var homeView : HomeProtocol!
    
    init(networkService : NetworkServices){
        self.networkService = networkService
    }
    
    func attachView(homeView : HomeProtocol){
        self.homeView = homeView
    }
    
    func getAllSports(){
        networkService.fetchAllSportsData { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let sport):
                    DispatchQueue.main.async {
                        self.mysports = sport?.sports ?? []
                        self.homeView.updatingCollectionView()
                    }
                case .failure(_):
                    print("ERROR")
                }
                
            }
        }
    }
}
