//
//  CoreDataManager.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 17.02.2021.
//

import UIKit
import CoreData

class CoreDataManager {
    
    var container: NSPersistentContainer!
    
    func saveQuest(title: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Quest",
                                                in: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        person.setValue(title, forKeyPath: "title")
        
        // 4
        do {
            try managedContext.save()
            print("Saved: \(title)")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getQuests() -> [Quest] {

        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        var quests: [Quest] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Quest")
        
        //3
        do {
            var questsObjects = try managedContext.fetch(fetchRequest)
            return quests
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }


}
