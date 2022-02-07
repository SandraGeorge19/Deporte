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

class LeagueDetailsViewController: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , LeaguesDetailsProtocol{
    
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
    var currentLeague:League!
    
    var leagueDetailsPresenter:LeagueDetailsPresenter!
    
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        initPresenter()
        requestData()
        startIndicator()
    }
    func initPresenter(){
        leagueDetailsPresenter = LeagueDetailsPresenter(leagueDetailsViewController: self,
                                                        teamsApi: TeamsAPI(),
                                                        eventsApi: EventsAPIImpl())
    }
    func requestData(){
        leagueDetailsPresenter.requestData(leagueID: currentLeague.idLeague ?? "", leagueName:currentLeague.strLeague ?? "")
    }
    @IBAction func onPressFavoriteBtn(_ sender: Any) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case upComingEventsTableView:
            print(upComingEvents.count)
            return upComingEvents.count
        
        case latestEventCollectionView:
            print(latestEvents.count)
            return latestEvents.count
            
        case teamsCollectionView:
            print(myTeams.count)
            return myTeams.count
        default:
            return 0
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case upComingEventsTableView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpComingEventCollectionViewCell", for: indexPath) as? UpComingEventCollectionViewCell else { return UICollectionViewCell() }
                cell.event=upComingEvents[indexPath.row]
              cell.teams=myTeams
              cell.setUpView()
            return cell
        case latestEventCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestEventCollectionViewCell", for: indexPath) as? LatestEventCollectionViewCell else { return UICollectionViewCell() }
            print("cellss \(myTeams.count)")
            print("Events \(latestEvents.count)")

            cell.event=latestEvents[indexPath.row]
            cell.teams=myTeams
            cell.setUpView()
            return cell
        case teamsCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as? TeamCollectionViewCell else { return UICollectionViewCell() }
            cell.teamsCell = myTeams[indexPath.row]
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestEventCollectionViewCell", for: indexPath) as? LatestEventCollectionViewCell else { return UICollectionViewCell() }
            cell.event=latestEvents[indexPath.row]
            cell.teams=myTeams
            return cell
        }
    }
    
    
    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch collectionView {
        case upComingEventsTableView:
            return CGSize(width: 384, height: 244)
        case latestEventCollectionView:
            return CGSize(width: 382, height: 98)
        case teamsCollectionView:
            return CGSize(width: 150, height: 190)
        default:
            return CGSize(width: 150, height: 190)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 15, left: 5, bottom: 1, right: 5)

       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case upComingEventsTableView:
            break
        case latestEventCollectionView:
            break
        case teamsCollectionView:
                let team = myTeams[indexPath.row]
                let teamDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
                let teamPresent = TeamPresenter(myTeam: team)
                teamDetailsVC.teamPresenter = teamPresent
                self.present(teamDetailsVC,animated: true,completion: nil)
        default:
            break
        }
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
