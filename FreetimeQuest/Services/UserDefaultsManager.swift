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

}
