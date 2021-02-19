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
    private let keyForSort = "id"
    
    var container: NSPersistentContainer!
    var viewContext: NSManagedObjectContext!
    
    static let shared = CoreDataManager()
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        self.viewContext = container.viewContext
    }

    
    func saveQuest(title: String,
                   id: Int,
                   category: Int) {
        let entity = NSEntityDescription.entity(forEntityName: entityName,
                                                in: viewContext)!
        
        let quest = NSManagedObject(entity: entity,
                                     insertInto: viewContext)
        
        quest.setValue(title, forKeyPath: "title")
        quest.setValue(id, forKeyPath: "id")
        quest.setValue(category, forKeyPath: "category")

        do {
            try viewContext.save()
            print("Saved: \(title)")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
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
    
    func fetchedResultsController(_ category: Category) -> NSFetchedResultsController<QuestObject> {

        let fetchRequest: NSFetchRequest<QuestObject> = QuestObject.fetchRequest()
        
        let predicate = NSPredicate(format: "category == %i", "\(category.rawValue)»")
        let sortDescriptor = NSSortDescriptor(key: keyForSort, ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.predicate = predicate
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: viewContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        return fetchedResultsController
    }

    func deleteQuests() {
        let fetchRequest: NSFetchRequest<QuestObject> = QuestObject.fetchRequest()

        fetchRequest.returnsObjectsAsFaults = false
            do {
                let results = try viewContext.fetch(fetchRequest)
                for object in results {
                    viewContext.delete(object)
                }
            } catch let error {
                print("Detele all data in QuestObject error :", error)
            }
    }

}
