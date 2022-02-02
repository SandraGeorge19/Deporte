//
//  LeagueDetailsViewController.swift
//  Deporte
//
//  Created by Abdo on 2/2/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var leagueDetailTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UpComingTableViewCell") as? UpComingTableViewCell else { return UITableViewCell() }
            cell.upComingCollectionView.delegate=self
            cell.upComingCollectionView.dataSource=self
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LatestEventsTableViewCell") as? LatestEventsTableViewCell else { return UITableViewCell() }
            cell.latestEventsCollectionView.delegate=self
            cell.latestEventsCollectionView.dataSource=self
            return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell") as? TeamsTableViewCell else { return UITableViewCell() }
                cell.teamsCollectionView.delegate=self
                cell.teamsCollectionView.dataSource=self
                return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LatestEventsTableViewCell") as? LatestEventsTableViewCell else { return UITableViewCell() }
        
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpComingEventCollectionViewCell", for: indexPath) as? UpComingEventCollectionViewCell else { return UICollectionViewCell() }

            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestEventCollectionViewCell", for: indexPath) as? LatestEventCollectionViewCell else { return UICollectionViewCell() }

            return cell
            case 2:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as? TeamCollectionViewCell else { return UICollectionViewCell() }
                
                return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestEventCollectionViewCell", for: indexPath) as? LatestEventCollectionViewCell else { return UICollectionViewCell() }
        
            return cell
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        leagueDetailTableView.delegate = self
        leagueDetailTableView.dataSource = self
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
