//
//  CoreDataManager.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 17.02.2021.
//

import UIKit
import CoreData

class CoreDataManager {
    
    private let entityName = "QuestObject"
    
    let container: NSPersistentContainer!
    let viewContext: NSManagedObjectContext!
    
    static let shared = CoreDataManager()
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        self.viewContext = container.viewContext
    }

    
    func saveQuest(title: String,
                   id: Int,
                   category: Int) {
        let entity = NSEntityDescription.entity(forEntityName: self.entityName,
                                                in: self.viewContext)!
        
        let quest = NSManagedObject(entity: entity,
                                    insertInto: self.viewContext)
        
        quest.setValue(title, forKeyPath: "title")
        quest.setValue(id, forKeyPath: "id")
        quest.setValue(category, forKeyPath: "category")
        
        saveContext()
    }
    
    func getQuests() -> [QuestObject] {
        let fetchRequest: NSFetchRequest<QuestObject> = QuestObject.fetchRequest()
        
        do {
            let questsObjects = try viewContext.fetch(fetchRequest)
            return questsObjects
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func questFRC() -> NSFetchedResultsController<QuestObject> {

        let fetchRequest: NSFetchRequest<QuestObject> = QuestObject.fetchRequest()

        let sectionDescriptor = NSSortDescriptor(key: "category", ascending: true)
        let idDescriptor = NSSortDescriptor(key: "id", ascending: true)
        
        fetchRequest.sortDescriptors = [sectionDescriptor, idDescriptor]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: viewContext,
                                                                  sectionNameKeyPath: "category",
                                                                  cacheName: nil)
        return fetchedResultsController
    }

    func deleteQuests() {
        let fetchRequest: NSFetchRequest<QuestObject> = QuestObject.fetchRequest()
        
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try self.viewContext.fetch(fetchRequest)
            for object in results {
                self.viewContext.delete(object)
            }
        } catch let error {
            print("Detele all data in QuestObject error :", error)
        }
        
        saveContext()
    }
    
    func deleteQuest(_ quest: QuestObject) {
        viewContext.delete(quest)
        saveContext()
    }
    
    func saveContext() {
        guard viewContext.hasChanges else {
            return
        }
        
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }


}
