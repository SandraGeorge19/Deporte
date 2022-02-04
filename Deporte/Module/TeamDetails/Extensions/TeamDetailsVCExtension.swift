//
//  TeamDetailsVCExtension.swift
//  Deporte
//
//  Created by sandra on 2/4/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit

extension TeamDetailsViewController : TeamProtocol{
    //MARK: -- Functions
    
    func viewShadowUI(view : UIView){
        view.layer.shadowColor = UIColor.lightGray.cgColor
        //for actual cell
        view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        view.layer.shadowRadius = 10.0
        view.layer.shadowOpacity = 0.5
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
        view.clipsToBounds = false
        view.layer.masksToBounds = false
    }
    
    func startIndicator(){
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
    }
    func initializingTeamPresenterAndGetData(){
        teamPresenter.attachView(teamDetailView: self)
        teamPresenter.getTeamDetailsToView()
    }
    func updatingTeamViewController() {
        myIndicator.stopAnimating()
    }
    
    func openSelectedApp(appName : String , linkURL : String){
        let appScheme = "\(appName)://app"
        let appUrl = URL(string: appScheme)
        if UIApplication.shared.canOpenURL(appUrl! as URL) {
            UIApplication.shared.open(appUrl!)
        } else {
            UIApplication.shared.open(URL(string: ("https://\(linkURL)"))!, options: [:], completionHandler: nil)
        }
    }
}
