//
//  LeagueDetailsVCExtension.swift
//  Deporte
//
//  Created by sandra on 2/4/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import Kingfisher

extension LeagueDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , LeaguesDetailsProtocol{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case upComingEventsTableView:
            //print(upComingEvents.count)
            return upComingEvents.count
        
        case latestEventCollectionView:
            //print(latestEvents.count)
            return latestEvents.count
            
        case teamsCollectionView:
            //print(myTeams.count)
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
//            print("cellss \(myTeams.count)")
//            print("Events \(latestEvents.count)")

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
            return CGSize(width: 384, height: 230)
        case latestEventCollectionView:
            return CGSize(width: 382, height: 98)
        case teamsCollectionView:
            return CGSize(width: 145, height: 180)
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
}
