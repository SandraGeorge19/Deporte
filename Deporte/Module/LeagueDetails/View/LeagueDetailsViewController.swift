//
//  LatestEvent2ViewController.swift
//  Deporte
//
//  Created by Abdo on 2/3/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire


protocol LeaguesDetailsProtocol {
    func updateCollectionView()
}

class LeagueDetailsViewController: UIViewController {
    
    //MARK: --IBOutlets
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var latesteEventCollectionHeight: NSLayoutConstraint!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var latestEventCollectionView: UICollectionView!
    @IBOutlet weak var upComingEventsTableView: UICollectionView!
    
    @IBOutlet weak var leagueDetailsScroll: UIScrollView!
    
    
    //MARK: --Properties
    let myIndicator = UIActivityIndicatorView(style: .large)
    
    var isFavorite = false
    //var favDel : favPro?
    var leagueDetailsPresenter:LeagueDetailsPresenter!
    
    let detailsRefreshControl = UIRefreshControl()
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllersDelegations()
        
        detailsRefreshControl.tintColor = UIColor(displayP3Red: 161/255, green: 70/255, blue: 242/255, alpha: 0.75)
        
        addingSwipe()
        
        checkingIsFavorite()
        
        requestData()
        startIndicator()
        refreshingLeagueDetailsScreen()
    }
    
    //MARK: --IBActions
    @IBAction func onPressFavoriteBtn(_ sender: Any) {
        isFavorite = !isFavorite
        guard let currentLeague = leagueDetailsPresenter.currentLeague else {return}
        if isFavorite == true{
            print("the Favourite\(currentLeague.strLeague ?? "")")
            leagueDetailsPresenter.coreData?.saveLeague(myLeague: currentLeague)
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else{
            leagueDetailsPresenter.coreData?.deleteLeague(delLeague: currentLeague)
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    
    @IBAction func didPressBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
