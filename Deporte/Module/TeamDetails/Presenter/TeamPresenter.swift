//
//  TeamPresenter.swift
//  Deporte
//
//  Created by sandra on 2/4/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation


class TeamPresenter{
    var myTeam : Team?
    weak var teamDetailView : TeamDetailsViewController?
    
    
    init(myTeam : Team){
        self.myTeam = myTeam
    }
    func attachView(teamDetailView : TeamDetailsViewController){
        self.teamDetailView = teamDetailView
    }
    
    func getTeamDetailsToView(){
        DispatchQueue.main.async {
            self.teamDetailView?.backgroundImg.kf.setImage(with: URL(string: self.myTeam?.strStadiumThumb ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            self.teamDetailView?.profileImg.kf.setImage(with: URL(string: self.myTeam?.strTeamBadge ?? "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png"))
            self.teamDetailView?.teamName.text = self.myTeam?.strTeam
            self.teamDetailView?.leagueName.text = self.myTeam?.strLeague
            self.teamDetailView?.stadiumName.text = self.myTeam?.strStadium
            self.teamDetailView?.countryName.text = self.myTeam?.strCountry
            self.teamDetailView?.descriptionName.text = self.myTeam?.strDescriptionEN
            self.teamDetailView?.updatingTeamViewController()
        }
    }
}
