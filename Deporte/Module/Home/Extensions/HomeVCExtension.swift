//
//  HomeVCExtension.swift
//  Deporte
//
//  Created by sandra on 2/3/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit


//MARK: -- Extensions - UICollectionView

extension HomeSportsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(homePresenter.mysports.count)
          return homePresenter.mysports.count
       }
       
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           //print("Helloooo from the cell")
           let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
        cell.sportItem = homePresenter.mysports[indexPath.row]
           return cell
           
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.bounds.width - 48) / 2, height: (self.view.bounds.width + 20) / 2)
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sport = homePresenter.mysports[indexPath.row]
        let leaguesViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController
        let leagePresenter = LeaguesPresenter(leaguesApi: LeaguesAPI() , sportName: sport.strSport ?? "")
        leaguesViewController.leaguesPresenter = leagePresenter
        self.navigationController?.pushViewController(leaguesViewController, animated: true)
    }

}

