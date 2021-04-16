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
            var star = 1
            if id >= 6 && id < 13 {
                star = 2
            } else if id >= 13 {
                star = 3
            }

            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.adventure.rawValue,
                                             stars: star)
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
