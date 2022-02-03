//
//  HomeSportsViewController.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

protocol HomeProtocol : AnyObject{
    func updatingCollectionView()
    func alertWillPresent()
}

class HomeSportsViewController: UIViewController ,HomeProtocol{
    
    //MARK: -- IBOutlets
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var internetMsgLbl: UILabel!
    
    
    //MARK: -- Propertiest
    
    let myIndicator = UIActivityIndicatorView(style: .large)
    var homePresenter : HomePresenter!
    
    //for refreshing the data that comes from api
    let refreshControl = UIRefreshControl()
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        startIndicator()
        
        checkConnectivity()
        
        refreshingHomeScreen()
    }
    
    //MARK: -- IBActions
    
    
}
