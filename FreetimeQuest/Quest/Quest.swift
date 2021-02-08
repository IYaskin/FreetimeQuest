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
    lazy var isCurrentKey = key + "isCurrent"
    lazy var dateKey = key + "date"
    lazy var imageDataKey = key + "imageData"
    
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
    
    var isCurrent: Bool {
        get {
            return UserDefaults.standard.bool(forKey: isCurrentKey)
        }
        set {
                UserDefaults.standard.set(newValue, forKey: isCurrentKey)
            }
        }
    
    var date: Double {
        get {
            return UserDefaults.standard.double(forKey: dateKey)
        }
        set {
                UserDefaults.standard.set(newValue, forKey: dateKey)
            }
        }
    
    var imageData: Data? {
        get {
            return UserDefaults.standard.data(forKey: imageDataKey)
        }
        set {
                UserDefaults.standard.set(newValue, forKey: imageDataKey)
            }
        }


}
