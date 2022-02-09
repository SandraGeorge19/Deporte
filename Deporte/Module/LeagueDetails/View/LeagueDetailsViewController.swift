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
    
    
    
    //MARK: --Properties
    let myIndicator = UIActivityIndicatorView(style: .large)
    
    var isFavorite = false
    //var favDel : favPro?
    var leagueDetailsPresenter:LeagueDetailsPresenter!
    
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllersDelegations()
        
        addingSwipe()
        
        isFavorite = leagueDetailsPresenter.coreData?.isLeagueExists(leagueID: leagueDetailsPresenter.currentLeague?.idLeague ?? "") ?? false
        if isFavorite{
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else{
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        requestData()
        startIndicator()
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
