//
//  LeagueDB+CoreDataProperties.swift
//  
//
//  Created by sandra on 2/7/22.
//
//

import Foundation
import CoreData


extension LeagueDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LeagueDB> {
        return NSFetchRequest<LeagueDB>(entityName: "LeagueDB")
    }

    @NSManaged public var idLeague: String?
    @NSManaged public var strSport: String?
    @NSManaged public var strLeague: String?
    @NSManaged public var strYoutube: String?
    @NSManaged public var strDescriptionEN: String?
    @NSManaged public var strBadge: String?

}
