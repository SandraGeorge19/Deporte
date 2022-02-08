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
    var myTeams : [Team] = []
    var upComingEvents:[Event] = []
    var latestEvents:[Event] = []
    var currentLeague: LeagueDB?
    var isFavorite = false {
        didSet{
            guard let currentLeague = currentLeague else {return}
            if isFavorite{
                print("the Favourite\(currentLeague.strLeague ?? "")")
                CoreDataServices.saveContext()
                favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            }else{
                CoreDataServices.deleteLeague(delLeague: currentLeague)
                favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            }
            
        }
    }
    
    var leagueDetailsPresenter:LeagueDetailsPresenter!
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllersDelegations()
        
        initPresenter()
        requestData()
        startIndicator()
    }
    
    //MARK: --IBActions
    @IBAction func onPressFavoriteBtn(_ sender: Any) {
        isFavorite = !isFavorite
    }
    
    //MARK: --Functions
    
    func configureViewControllersDelegations(){
        teamsCollectionView.dataSource=self
        teamsCollectionView.delegate=self
        latestEventCollectionView.dataSource=self
        latestEventCollectionView.delegate=self
        upComingEventsTableView.delegate=self
        upComingEventsTableView.dataSource=self
        let myCell1 = UINib(nibName: "UpComingEventCollectionViewCell", bundle: nil)
        upComingEventsTableView.register(myCell1, forCellWithReuseIdentifier: "UpComingEventCollectionViewCell")
        let myCell2 = UINib(nibName: "LatestEventCollectionViewCell", bundle: nil)
        latestEventCollectionView.register(myCell2, forCellWithReuseIdentifier: "LatestEventCollectionViewCell")
        let myCell3 = UINib(nibName: "TeamCollectionViewCell", bundle: nil)
        teamsCollectionView.register(myCell3, forCellWithReuseIdentifier: "TeamCollectionViewCell")
        latesteEventCollectionHeight.constant = (98 + 16) * 5
        // Do any additional setup after loading the view.
    }
    func initPresenter(){
        leagueDetailsPresenter = LeagueDetailsPresenter(leagueDetailsViewController: self,
                                                        teamsApi: TeamsAPI(),
                                                        eventsApi: EventsAPIImpl())
    }
    func requestData(){
        leagueDetailsPresenter.requestData(leagueID: currentLeague?.idLeague ?? "", leagueName:currentLeague?.strLeague ?? "")
    }
    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    
    
    
    func updateCollectionView() {
        upComingEventsTableView.reloadData()
        latesteEventCollectionHeight.constant = CGFloat((98) * latestEvents.count)
        latestEventCollectionView.reloadData()
        teamsCollectionView.reloadData()
        myIndicator.stopAnimating()
    }
    
    
}
