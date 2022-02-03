//
//  TabBarVCExtention.swift
//  Deporte
//
//  Created by sandra on 2/3/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit



extension TabBarVC{
    //MARK: -- Functions
    
    func  initViewControllers(){
        Home = self.storyboard?.instantiateViewController(identifier: "HomeSportsViewController") as? HomeSportsViewController
        Fav = self.storyboard?.instantiateViewController(identifier: "FavouritesTableViewController") as? FavouritesTableViewController
    }
    
    func tabBarUI(){
        viewForTab.layer.cornerRadius = viewForTab.frame.size.height / 2
        viewForTab.clipsToBounds = true
    }
    
    func showHome(){
        contentView.addSubview(Home!.view)
        addChild(Home!)
        self.navigationItem.title = "Deporte"
        homeImg.tintColor = UIColor.white
        favImg.tintColor = UIColor.gray
    }
    
    func showFav(){
        contentView.addSubview(Fav!.view)
        addChild(Fav!)
        self.navigationItem.title = "Favourites"
        favImg.tintColor = UIColor.white
        homeImg.tintColor = UIColor.gray
    }
}
