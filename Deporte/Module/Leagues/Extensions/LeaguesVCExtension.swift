//
//  LeaguesVCExtension.swift
//  Deporte
//
//  Created by sandra on 2/3/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit


extension LeaguesTableViewController{
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(leaguesPresenter.myLeagues.count)
        return leaguesPresenter.myLeagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
        // Configure the cell...
        cell.leagueCell = leaguesPresenter.myLeagues[indexPath.row]
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HEllo from cell Leages")
        let leage = leaguesPresenter.myLeagues[indexPath.row]
        let leagueDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "LatestEvent2ViewController") as! LeagueDetailsViewController
        
       let presenter = LeagueDetailsPresenter(leagueDetailsViewController: leagueDetailVC, teamsApi: TeamsAPI(), eventsApi: EventsAPIImpl())
        leagueDetailVC.leagueDetailsPresenter = presenter
        
        presenter.currentLeague = leage
       
        self.present(leagueDetailVC, animated: true, completion: nil)
    }
}

