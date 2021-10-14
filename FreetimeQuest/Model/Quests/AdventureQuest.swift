//
//  AdventureQuest.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class AdventureQuests {
    
    static func addQuests() {
        let titles = ["Adventure.Sunrise",
                      "Adventure.Bet",
                      "Adventure.NightCity",
                      "Adventure.ParkAttractions",
                      "Adventure.Snowboard",
                      "Adventure.Stars",
                      
                      "Adventure.Horse",
                      "Adventure.RopeJumping",
                      "Adventure.Tents",
                      "Adventure.Waterfall",
                      "Adventure.Cruise",
                      "Adventure.Island",
                      "Adventure.Cold",
                      
                      "Adventure.Lights",
                      "Adventure.Surfing",
                      "Adventure.Scuba",
                      "Adventure.SmallPlane",
                      "Adventure.Balloon",
                      "Adventure.Tatoo",
                      "Adventure.Autostop",
                      "Adventure.Parachute"]

        
        for (id, title) in titles.enumerated() {
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.adventure.rawValue)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        let images = ["sunrise",
                      "betting",
                      "nightride",
                      "parkattraction",
                      "snowboard",
                      "stars",
                      
                      "horse",
                      "rope",
                      "tents",
                      "waterfall",
                      "cruise",
                      "island",
                      "prorub",
                      
                      "northernlights",
                      "surfing",
                      "scuba",
                      "plane",
                      "balloon",
                      "tattoo",
                      "autostop",
                      "parachute"]

        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }

    }

}

//static func addQuests() {
//    
//    let titles = ["Charisma.Teeth",
//                  "Charisma.Massage",
//                  "Charisma.Yoga",
//                  "Charisma.Meditation",
//                  "Charisma.Speech",
//                  "Charisma.Posture",
//                  "Charisma.Temper",
//                  "Charisma.Morning",
//                  "Charisma.Food",
//                  "Charisma.Books",
//                  "Charisma.Income",
//                  "Charisma.Fotosession",
//                  "Charisma.Psychologist",
//                  "Charisma.Buy",
//                  "Charisma.Weight",
//                  "Charisma.Marathon",
//                  "Charisma.BadHabit"]
//}
//
//static func getIcon(id: Int) -> UIImage? {
//    
//    let images = ["teeth",
//                  "massage",
//                  "yoga",
//                  "meditation",
//                  "speaking",
//                  "posture",
//                  "zakalka",
//                  "zaryadka",
//                  "goodfood",
//                  "5books",
//                  "money",
//                  "photosession",
//                  "psycholog",
//                  "buything",
//                  "perfectweight",
//                  "marathon",
//                  "badhabit"]
//    
//    if id >= 0 && id <= images.count {
//        return UIImage(named: images[id])
//    } else {
//        return nil
//    }
//
//}
