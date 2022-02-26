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
        let entity = NSEntityDescription.entity(forEntityName: self.questEntityName,
                                                in: self.viewContext)!
        
        let quest = NSManagedObject(entity: entity,
                                    insertInto: self.viewContext)
        
        quest.setValue(title, forKeyPath: "title")
        quest.setValue(id, forKeyPath: "id")
        quest.setValue(category, forKeyPath: "category")
        
        UserDefaultsManager.shared.allQuestsCount += 1
        
        saveContext()
    }
        
    func questFRC() -> NSFetchedResultsController<QuestObject> {

        let fetchRequest: NSFetchRequest<QuestObject> = QuestObject.fetchRequest()

        let idDescriptor = NSSortDescriptor(key: "id", ascending: true)
        
        fetchRequest.sortDescriptors = [idDescriptor]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: viewContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        return fetchedResultsController
    }
    
    func doneQuest(_ quest: QuestObject, isDone: Bool) {
        quest.isDone = isDone
        UserDefaultsManager.shared.doneQuestsCount += isDone ? 1 : -1
        saveContext()
    }
    
    func deleteQuest(_ quest: QuestObject) {
        if quest.isDone {
            UserDefaultsManager.shared.doneQuestsCount -= 1
        }
        UserDefaultsManager.shared.allQuestsCount -= 1
        
        viewContext.delete(quest)
        saveContext()
    }
    
    func setQuestImage(_ quest: QuestObject, image: Data) {
        quest.image = image
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
