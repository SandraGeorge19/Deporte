//
//  LeagueDB+CoreDataClass.swift
//  
//
//  Created by sandra on 2/7/22.
//
//

import Foundation
import CoreData

enum DecoderConfigurationError : Error {
    case missingManagedObjectContext
}

@objc(LeagueDB)
public class LeagueDB: NSManagedObject , Decodable{

    enum CodingKeys : String , CodingKey{
        case idLeague = "idLeague"
        case strSport = "strSport"
        case strLeague = "strLeague"
        case strYoutube = "strYoutube"
        case strDescriptionEN = "strDescriptionEN"
        case strBadge = "strBadge"
    }
    required convenience public init(from decoder : Decoder) {
        guard let entity = NSE else {
            <#statements#>
        }
    }
}
