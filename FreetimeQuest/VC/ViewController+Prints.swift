//
//  ViewController+Prints.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 31.01.2021.
//

import Foundation

extension ViewController {
    
    func printQuests() {
        print("Оставшиеся квесты:")
        CoreDataManager.shared.getQuests().forEach { (quest) in
            print("---")
            print("Quest = \(quest.title!)")
            print("id = \(quest.id)")
            if let category = Category(rawValue: Int(quest.category)) {
                print("category = \(category.title) - \(quest.category)")
            } else {
                print("category = \(quest.category)")
            }
        }
        print("-------------------")
    }
}
