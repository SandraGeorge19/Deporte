//
//  ConverterClass.swift
//  Deporte
//
//  Created by sandra on 2/8/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import CoreData

extension League{
    
    func convertToLeagueDB(managedContext : NSManagedObjectContext) -> LeagueDB{
        let newL = LeagueDB(context: managedContext)
        newL.idLeague = self.idLeague
        newL.strSport = self.strSport
        newL.strBadge = self.strBadge
        newL.strYoutube = self.strYoutube
        newL.strLeague = self.strLeague
        newL.strDescriptionEN = self.strDescriptionEN
        
        return newL
    }
}

extension LeagueDB{
    func convertToLeague() -> League{
        let newL = League()
        newL.idLeague = self.idLeague
        newL.strSport = self.strSport
        newL.strBadge = self.strBadge
        newL.strYoutube = self.strYoutube
        newL.strLeague = self.strLeague
        newL.strDescriptionEN = self.strDescriptionEN
        
        return newL
    }
}
