//
//  LeagueDetailsViewController.swift
//  Deporte
//
//  Created by Abdo on 2/2/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
private let itemsPerRow: CGFloat = 1
private let sectionInsets = UIEdgeInsets(
    top: 200,
left: 20.0,
bottom: 20.0,
right: 20.0)
class LeagueDetailsViewController: UITableViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UpComingTableViewCell") as? UpComingTableViewCell else { return UITableViewCell() }
            cell.upComingCollectionView.delegate=self
            cell.upComingCollectionView.dataSource=self
            cell.upComingCollectionView.collectionViewLayout.invalidateLayout()

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LatestEventsTableViewCell") as? LatestEventsTableViewCell else { return UITableViewCell() }
            cell.latestEventsCollectionView.delegate=self
            cell.latestEventsCollectionView.dataSource=self
            cell.latestEventsCollectionView.collectionViewLayout.invalidateLayout()

            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell") as? TeamsTableViewCell else { return UITableViewCell() }
            cell.teamsCollectionView.delegate=self
            cell.teamsCollectionView.dataSource=self
            cell.teamsCollectionView.collectionViewLayout.invalidateLayout()
            return cell
        default:
             return UITableViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let myCell1 = UINib(nibName: "UpComingTableViewCell", bundle: nil)
        self.tableView.register(myCell1, forCellReuseIdentifier: "UpComingTableViewCell")
        let myCell2 = UINib(nibName: "LatestEventsTableViewCell", bundle: nil)
        self.tableView.register(myCell2, forCellReuseIdentifier: "LatestEventCollectionViewCell")
        let myCell3 = UINib(nibName: "TeamsTableViewCell", bundle: nil)
        self.tableView.register(myCell3, forCellReuseIdentifier: "TeamsTableViewCell")
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch indexPath.item {
//        case 0:
//            return CGSize(width: 100, height: 100)
//        case 1:
//            return CGSize(width: 100, height: 100)
//        case 2:
//            return CGSize(width: 180, height: 180)
//
//        default:
//            return CGSize(width: 100, height: 100)
//
//        }
//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20

       }



       
    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
      // 2
      let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
      let availableWidth = view.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow
      
      return CGSize(width: widthPerItem, height: widthPerItem)
    }


       



       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
              return UIEdgeInsets(top: 15, left: 5, bottom: 1, right: 5)

          }
}
