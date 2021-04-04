//
//  UserDefaultsManager.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private init() {
    }
    
    var isBaseQuestsSet: Bool {
        
        get {
            UserDefaults.standard.bool(forKey: "isBaseQuestsSet")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isBaseQuestsSet")
        }
        
    }
    
    var allQuestsCount: Int {
        
        get {
            UserDefaults.standard.integer(forKey: "allQuestsCount")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "allQuestsCount")
        }
    }

    var doneQuestsCount: Int {
        
        get {
            UserDefaults.standard.integer(forKey: "doneQuestsCount")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "doneQuestsCount")
        }
    }
    
    var starsCount: Int {
        
        get {
            UserDefaults.standard.integer(forKey: "starsCount")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "starsCount")
        }
    }
    
    // AdditionalQuests

    var isGoodQuestsSet: Bool {
        
        get {
            UserDefaults.standard.bool(forKey: "isGoodQuestsSet")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isGoodQuestsSet")
        }
        
    }

    var isHobbyQuestsSet: Bool {
        
        get {
            UserDefaults.standard.bool(forKey: "isHobbyQuestsSet")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isHobbyQuestsSet")
        }
        
    }
    
    
    var isSocialQuestsSet: Bool {
        
        get {
            UserDefaults.standard.bool(forKey: "isSocialQuestsSet")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isSocialQuestsSet")
        }
        
    }

    var isCharismaQuestsSet: Bool {
        
        get {
            UserDefaults.standard.bool(forKey: "isCharismaQuestsSet")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isCharismaQuestsSet")
        }
        
    }

    var isAdventureQuestsSet: Bool {
        
        get {
            UserDefaults.standard.bool(forKey: "isAdventureQuestsSet")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isAdventureQuestsSet")
        }
        
    }


}
