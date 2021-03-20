//
//  CoreDataManager.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 17.02.2021.
//

import UIKit
import CoreData

class CoreDataManager {
    
    private let questEntityName = "QuestObject"
    private let memoryEntityName = "MemoryObject"
    
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
                   category: Int,
                   stars: Int) {
        let entity = NSEntityDescription.entity(forEntityName: self.questEntityName,
                                                in: self.viewContext)!
        
        let quest = NSManagedObject(entity: entity,
                                    insertInto: self.viewContext)
        
        quest.setValue(title, forKeyPath: "title")
        quest.setValue(id, forKeyPath: "id")
        quest.setValue(category, forKeyPath: "category")
        quest.setValue(stars, forKeyPath: "stars")
        
        if category != Category.freetimeQuest.rawValue {
            UserDefaultsManager.shared.allQuestsCount += 1
        }

        saveContext()
    }
    
    func saveMemory(title: String,
                    date: Date,
                    image: Data?) {
        let entity = NSEntityDescription.entity(forEntityName: self.memoryEntityName,
                                                in: self.viewContext)!
        
        let quest = NSManagedObject(entity: entity,
                                    insertInto: self.viewContext)
        
        quest.setValue(title, forKeyPath: "title")
        quest.setValue(date, forKeyPath: "date")
        quest.setValue(image, forKeyPath: "image")
        
        saveContext()
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
    
    func memoryFRC() -> NSFetchedResultsController<MemoryObject> {

        let fetchRequest: NSFetchRequest<MemoryObject> = MemoryObject.fetchRequest()

        let dataDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        fetchRequest.sortDescriptors = [dataDescriptor]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: viewContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        return fetchedResultsController
    }
    
    func doneQuest(_ quest: QuestObject) {
        let title = quest.title
        let date = Date()
        let image = UIImage(named: "photo")!
        UserDefaultsManager.shared.doneQuestsCount += 1
        UserDefaultsManager.shared.starsCount += Int(quest.stars)
        viewContext.delete(quest)
        saveContext()
        
        saveMemory(title: title,
                   date: date,
                   image: image.jpegData(compressionQuality: 1))
    }
    
    func deleteQuest(_ quest: QuestObject) {
        viewContext.delete(quest)
        UserDefaultsManager.shared.allQuestsCount -= 1
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
