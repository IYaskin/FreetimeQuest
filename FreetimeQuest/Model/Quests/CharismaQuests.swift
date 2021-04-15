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
                      "badhabbit"]
        
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }

    }

}
