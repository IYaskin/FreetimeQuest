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
    
    static let shared = CoreDataManager()
    
    private init() {}

    
    func saveQuest(title: String,
                   id: Int,
                   type: Int) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "QuestObject",
                                                in: managedContext)!
        
        let quest = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        quest.setValue(title, forKeyPath: "title")
        quest.setValue(id, forKeyPath: "id")
        quest.setValue(type, forKeyPath: "type")

        do {
            try managedContext.save()
            print("Saved: \(title)")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getQuests() -> [QuestObject] {

        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<QuestObject> = QuestObject.fetchRequest()
        
        do {
            let questsObjects = try managedContext.fetch(fetchRequest)
            return questsObjects
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }


}
