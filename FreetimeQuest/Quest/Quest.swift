//
//  Quest.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import Foundation

class Quest {
    let title: String
    let key: String
    let number: Int
    let type: QuestType
    
    lazy var isDoneKey = key + "isDone"
    lazy var isDeletedKey = key + "isDeleted"
    
    init(title: String,
         key: String,
         number: Int,
         type: QuestType) {
        self.title = title
        self.key = key
        self.number = number
        self.type = type
    }

    //let photo: UIImage?
    
    var isDone: Bool {
        get {
            return UserDefaults.standard.bool(forKey: isDoneKey)
        }
        set {
                UserDefaults.standard.set(newValue, forKey: isDoneKey)
            }
        }
    
    var isDeleted: Bool {
        get {
            return UserDefaults.standard.bool(forKey: isDeletedKey)
        }
        set {
                UserDefaults.standard.set(newValue, forKey: isDeletedKey)
            }
        }
}
