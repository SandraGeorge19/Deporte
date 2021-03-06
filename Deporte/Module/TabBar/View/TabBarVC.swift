//
//  ViewController.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import UIKit

class TabBarVC: UIViewController {

    
    //MARK: -- IBOutlets
    @IBOutlet weak var viewForTab: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var favImg: UIImageView!
    
    
    //MARK: -- Properties
    var Home : UIViewController?
    var Fav : UIViewController?
    
    //MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewControllers()
        tabBarUI()
        showHome()
    }

    //MARK: -- IBActions
    
    @IBAction func onClickTabBar(_ sender: UIButton) {
        let _ = sender.tag == 1 ? showHome() : showFav()
    }
    
    
}
