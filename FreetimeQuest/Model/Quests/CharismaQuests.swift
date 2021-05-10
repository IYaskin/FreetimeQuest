//
//  Charisma.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import UIKit

class CharismaQuests {
    
    static func addQuests() {
        
        let titles = ["Charisma.Teeth",
                      "Charisma.Massage",
                      "Charisma.Yoga",
                      "Charisma.Meditation",
                      "Charisma.Speech",
                      "Charisma.Posture",
                      "Charisma.Temper",
                      "Charisma.Morning",
                      "Charisma.Food",
                      "Charisma.Books",
                      "Charisma.Income",
                      "Charisma.Fotosession",
                      "Charisma.Psychologist",
                      "Charisma.Buy",
                      "Charisma.Weight",
                      "Charisma.Marathon",
                      "Charisma.BadHabit"]


        for (id, title) in titles.enumerated() {
            let star = id < 14 ? 2 : 3
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.charisma.rawValue,
                                             stars: star)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        
        let images = ["teeth",
                      "massage",
                      "yoga",
                      "meditation",
                      "speaking",
                      "posture",
                      "zakalka",
                      "zaryadka",
                      "goodfood",
                      "5books",
                      "money",
                      "photosession",
                      "psycholog",
                      "buything",
                      "perfectweight",
                      "marathon",
                      "badhabit"]
        
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }

    }
    
    static func getURLString(id: Int) -> String? {
        let urls: [String?] = ["Charisma.URL.Teeth",
                               "Charisma.URL.Massage",
                               "Charisma.URL.Yoga",
                               "Charisma.URL.Meditation",
                               "Charisma.URL.Speech",
                               "Charisma.URL.Posture",
                               "Charisma.URL.Temper",
                               "Charisma.URL.Morning",
                               "Charisma.URL.Food",
                               "Charisma.URL.Books",
                               nil,
                               "Charisma.URL.Fotosession",
                               "Charisma.URL.Psychologist",
                               nil,
                               nil,
                               "Charisma.URL.Marathon",
                               "Charisma.URL.BadHabit"]
        
        guard id >= 0 &&
              id <= urls.count else {
            return nil
        }
        
        guard let url = urls[id] else  {
            return nil
        }
        return NSLocalizedString(url, comment: "")
    }
    
    static func getInfoString(id: Int) -> String? {
        let infos: [String?] = [nil,
                                nil,
                                nil,
                                nil,
                                nil,
                                nil,
                                nil,
                                nil,
                                nil,
                                nil,
                                "Charisma.INFO.Income",
                                nil,
                                nil,
                                "Charisma.INFO.Buy",
                                "Charisma.INFO.Weight",
                                nil,
                                nil]
        
        guard id >= 0 &&
                id <= infos.count else {
            return nil
        }
        
        guard let info = infos[id] else  {
            return nil
        }
        return NSLocalizedString(info, comment: "")
    }

}
