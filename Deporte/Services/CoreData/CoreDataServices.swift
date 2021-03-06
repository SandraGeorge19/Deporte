//
//  CoreDataServices.swift
//  Deporte
//
//  Created by sandra on 2/7/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension CodingUserInfoKey{
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

class CoreDataServices{
    
    let appDelegate : AppDelegate!
    //let shared = CoreDataServices()
    let managedContext : NSManagedObjectContext!
    let entity : NSEntityDescription!
       // = NSEntityDescription.entity(forEntityName: "LeagueDB", in: managedContext)
    
    init(appDelegate : AppDelegate){
        self.appDelegate = appDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "LeagueDB", in: managedContext)
    }
    
    func saveLeague(myLeague : League){
        //let entity = NSEntityDescription.entity(forEntityName: "LeagueDB", in: managedContext)
        let savedLeage = NSManagedObject(entity: entity, insertInto: managedContext)
        savedLeage.setValue(myLeague.idLeague , forKey: "idLeague")
        savedLeage.setValue(myLeague.strLeague , forKey: "strLeague")
        savedLeage.setValue(myLeague.strSport , forKey: "strSport")
        savedLeage.setValue(myLeague.strBadge , forKey: "strBadge")
        savedLeage.setValue(myLeague.strYoutube , forKey: "strYoutube")
        savedLeage.setValue(myLeague.strDescriptionEN , forKey: "strDescriptionEN")
        do{
            print("SAVED")
            try managedContext.save()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    func fetchLeagues() -> [LeagueDB]{
        let request = NSFetchRequest<LeagueDB>(entityName: "LeagueDB")
        var  result : [LeagueDB] = []
        do{
            result = try managedContext.fetch(request)
        }catch let error{
            print(error.localizedDescription)
        }
        return result
    }
    
    func deleteLeague(delLeague : LeagueDB){
        
        print(delLeague.strLeague ?? "no leg")
        managedContext.delete(delLeague)
        do{
            try managedContext.save()
        }catch let error{
            print(error.localizedDescription)
            print("nooooooo")
        }
    }
    
    func deleteLeague(delLeague : League){
        var tempLeague : LeagueDB?
        
        let favLeagues = fetchLeagues()
        
            for league in favLeagues{
                
                if league.idLeague == delLeague.idLeague{
                    tempLeague = league
                }
            }
        guard let temp = tempLeague else {
            return
        }
        deleteLeague(delLeague: temp)
            
    }
    
    
    func isLeagueExists(leagueID:String)->Bool{
        let favLeagues = fetchLeagues()
        for league in favLeagues{
            if league.idLeague == leagueID{
                return true
            }
        }
        return false
    }
}
