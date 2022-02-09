//
//  Constants.swift
//  Deporte
//
//  Created by sandra on 2/1/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation


struct Constants {
    static let BASE_URL = "https://www.thesportsdb.com/api/v1/json/2/"
    static let GET_ALL_SPORTS = "all_sports.php?"
    static let GET_ALL_LEAGUES = "search_all_leagues.php?"
    static let GET_TEAM_DETAILS = "search_all_teams.php?"
    static let GET_UPCOMING_EVENTS="eventsseason.php?"
    static let GET_LATEST_EVENT = "eventsseason.php?"
    static let GET_EVENTS = "eventsseason.php?"

}

struct ErrorMessage {
    static let genericError = "Something went wrong, Please try again!"
}
