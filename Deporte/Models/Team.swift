//
//  Team.swift
//  Deporte
//
//  Created by sandra on 2/4/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

class Team : Codable{
    var idTeam : String?
    var idSoccerXML : String?
    var idAPIfootball : String?
    var intLoved : String?
    var strTeam : String?
    var strTeamShort : String?
    var strAlternate : String?
    var intFormedYear : String?
    var strSport : String?
    var strLeague : String?
    var idLeague : String?
    var strLeague2 : String?
    var idLeague2 : String?
    var strLeague3 : String?
    var idLeague3 : String?
    var strLeague4 : String?
    var idLeague4 : String?
    var strLeague5 : String?
    var idLeague5 : String?
    var strLeague6 : String?
    var idLeague6 : String?
    var strLeague7 : String?
    var idLeague7 : String?
    var strDivision : String?
    var strManager : String?
    var strStadium : String?
    var strKeywords : String?
    var strRSS : String?
    var strStadiumThumb : String?
    var strStadiumDescription : String?
    var strStadiumLocation : String?
    var intStadiumCapacity : String?
    var strWebsite : String?
    var strFacebook : String?
    var strTwitter : String?
    var strInstagram : String?
    var strDescriptionEN : String?
    var strDescriptionDE : String?
    var strDescriptionFR : String?
    var strDescriptionCN : String?
    var strDescriptionIT : String?
    var strDescriptionJP : String?
    var strDescriptionRU : String?
    var strDescriptionES : String?
    var strDescriptionPT : String?
    var strDescriptionSE : String?
    var strDescriptionNL : String?
    var strDescriptionHU : String?
    var strDescriptionNO : String?
    var strDescriptionIL : String?
    var strDescriptionPL : String?
    var strGender : String?
    var strCountry : String?
    var strTeamBadge : String?
    var strTeamJersey : String?
    var strTeamLogo : String?
    var strTeamFanart1 : String?
    var strTeamFanart2 : String?
    var strTeamFanart3 : String?
    var strTeamFanart4 : String?
    var strTeamBanner : String?
    var strYoutube : String?
    var strLocked : String?
}

class AllTeams : Codable{
    var teams : [Team]
}
