//
//  UpComingEventsResponse.swift
//  Deporte
//
//  Created by Abdo on 2/5/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

class EventResponse:Codable{
    var event: [Event]
}
class LatestEventResponse:Codable{
    var events: [LatestEvent]
}


class Event :Codable {
    var idEvent: String?
    var idSoccerXML: String?
    var idAPIfootball: String?
    var strEvent: String?
    var strEventAlternate: String?
    var strFilename: String?
    var strSport: String?
    var idLeague: String?
    var strLeague: String?
    var strSeason: String?
    var strDescriptionEN: String?
    var strHomeTeam: String?
    var strAwayTeam: String?
    var intHomeScore: String?
    var intRound: String?
    var intAwayScore: String?
    var intSpectators: String?
    var strOfficial: String?
    var strTimestamp: String?
    var dateEvent: String?
    var dateEventLocal: String?
    var strTime: String?
    var strTimeLocal: String?
    var strTVStation: String?
    var idHomeTeam: String?
    var idAwayTeam: String?
    var strResult: String?
    var strVenue: String?
    var strCountry: String?
    var strCity: String?
    var strPoster: String?
    var strSquare: String?
    var strFanart: String?
    var strThumb: String?
    var strBanner: String?
    var strMap: String?
    var strTweet1: String?
    var strTweet2: String?
    var strTweet3: String?
    var strVideo: String?
    var strStatus: String?
    var strPostponed: String?
    var strLocked: String?

}
class LatestEvent :Codable {
    var idEvent: String?
    var idSoccerXML: String?
    var idAPIfootball: String?
    var strEvent: String?
    var strEventAlternate: String?
    var strFilename: String?
    var strSport: String?
    var idLeague: String?
    var strLeague: String?
    var strSeason: String?
    var strDescriptionEN: String?
    var strHomeTeam: String?
    var strAwayTeam: String?
    var intHomeScore: String?
    var intRound: String?
    var intAwayScore: String?
    var intSpectators: String?
    var strOfficial: String?
    var strTimestamp: String?
    var dateEvent: String?
    var dateEventLocal: String?
    var strTime: String?
    var strTimeLocal: String?
    var strTVStation: String?
    var idHomeTeam: String?
    var idAwayTeam: String?
    var strResult: String?
    var strVenue: String?
    var strCountry: String?
    var strCity: String?
    var strPoster: String?
    var strSquare: String?
    var strFanart: String?
    var strThumb: String?
    var strBanner: String?
    var strMap: String?
    var strTweet1: String?
    var strTweet2: String?
    var strTweet3: String?
    var strVideo: String?
    var strStatus: String?
    var strPostponed: String?
    var strLocked: String?
}
