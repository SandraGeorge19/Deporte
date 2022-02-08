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
    
    static let shared = CoreDataServices()
    static let managedContext = shared.persistentContainer.viewContext
    static let entity = NSEntityDescription.entity(forEntityName: "LeagueDB", in: managedContext)
    
    private init(){
        
    }
    
    static func saveLeague(myLeague : LeagueDB){
        do{
            print("SAVED")
            try managedContext.save()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    static func fetchLeagues() -> [LeagueDB]?{
        let request = NSFetchRequest<LeagueDB>(entityName: "LeagueDB")
        do{
            let result = try managedContext.fetch(request)
            return result
        }catch let error{
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func deleteLeague(delLeague : LeagueDB){
        managedContext.delete(delLeague)
        do{
            try managedContext.save()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Deporte")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    static func saveContext () {
        //let context = persistentContainer.viewContext
        if managedContext.hasChanges {
            do {
                try managedContext.save()
                print("SAVVVVVEEEEDDDD")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
