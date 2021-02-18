//
//  ViewController+Prints.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 31.01.2021.
//

import Foundation

extension ViewController {
    
//    func printInfo() {
//        printQuests()
//        printСurrentQuest()
//        printСurrentQuests()
//    }
//    
//    func printСurrentQuest() {
//        print("Текущий квест \(currentQuest?.title ?? "нет")")
//    }
//    
//    func printСurrentQuests() {
//        print("Текущие квесты:")
//        getQuests().forEach {
//            if $0.isCurrent {
//                print($0.title)
//            }
//        }
//    }
//    
    func printQuests() {
        print("Оставшиеся квесты:")
        CoreDataManager.shared.getQuests().forEach { (quest) in
            print("---")
            print("Quest = \(quest.title!)")
            print("id = \(quest.id)")
            print("type = \(quest.type)")
            print("---")
        }
        print("-------------------")
    }
//    
//    func printUserDefaults() {
//        
//        let uselessKeysArray = ["AKLastIDMSEnvironment",
//                                "AppleLanguages",
//                                "AddingEmojiKeybordHandled",
//                                "NSLanguages",
//                                "PKKeychainVersionKey",
//                                "AppleKeyboards",
//                                "AppleKeyboardsExpanded",
//                                "AppleLanguagesDidMigrate",
//                                "AppleITunesStoreItemKinds",
//                                "NSInterfaceStyle",
//                                "PKLogNotificationServiceResponsesKey",
//                                "ApplePasscodeKeyboards",
//                                "NSAllowsDefaultLineBreakStrategy"]
//        
//        print("---------------------------------------------------------------------")
//        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
//            if !uselessKeysArray.contains(key) {
//                //print("\(key) = \(value) \n")
//            }
//        }
//        print("---------------------------------------------------------------------")
//
//    }
}
