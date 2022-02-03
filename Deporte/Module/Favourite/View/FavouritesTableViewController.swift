//
//  FavouritesTableViewController.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit
import Alamofire

class FavouritesTableViewController: UITableViewController {
    
    //MARK: -- IBOutlets
    
    
    //MARK: -- Propertiest
    let sports : [Sport] = [
           Sport(image: "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png", title: "Tennis"),
           Sport(image: "https://leisure.union.ufl.edu/Content/Images/leisure-courses.png", title: "Love Football"),
           Sport(image: "https://cdn2.iconfinder.com/data/icons/new-year-resolutions/64/resolutions-06-512.png", title: "Basketball"),
           Sport(image: "https://pngimage.net/wp-content/uploads/2018/05/courses-png.png", title: "Bing Bong"),
           Sport(image: "https://www.pngitem.com/pimgs/m/49-491826_of-course-developing-your-employee-engagement-offering-business.png", title: "Volleyball"),
           Sport(image: "https://png.pngitem.com/pimgs/s/415-4157244_transparent-anime-christmas-png-christmas-tree-png-download.png", title: "Rugby")
       ]
    //MARK: -- LifeCycle
    override func viewDidLoad() {
           super.viewDidLoad()

           // Uncomment the following line to preserve selection between presentations
           // self.clearsSelectionOnViewWillAppear = false

           // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
       }
    
    //MARK: -- IBActions
    
    //MARK: -- Functions

   
}

