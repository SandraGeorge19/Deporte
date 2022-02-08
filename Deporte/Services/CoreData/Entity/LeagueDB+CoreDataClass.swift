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
public class LeagueDB: NSManagedObject {
//    var core : CoreDataServices!
//
//    enum CodingKeys : String , CodingKey{
//        case idLeague = "idLeague"
//        case strSport = "strSport"
//        case strLeague = "strLeague"
//        case strYoutube = "strYoutube"
//        case strDescriptionEN = "strDescriptionEN"
//        case strBadge = "strBadge"
//    }
//    required convenience public init(from decoder : Decoder) throws{
//        self.init()
//        guard let entity = NSEntityDescription.entity(forEntityName: "LeagueDB", in: self.core.managedContext) else {
//            fatalError("FAILED TO DECODE League CLASS")
//        }
//        self.init(entity : entity, insertInto: core.managedContext)
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        idLeague = try container.decode(String.self, forKey: .idLeague)
//        strSport = try container.decode(String.self, forKey: .strSport)
//        strLeague = try container.decode(String.self, forKey: .strLeague)
//        strYoutube = try container.decode(String.self, forKey: .strYoutube)
//        strDescriptionEN = try container.decode(String.self, forKey: .strDescriptionEN)
//        strBadge = try container.decode(String.self, forKey: .strBadge)
//    }
}
