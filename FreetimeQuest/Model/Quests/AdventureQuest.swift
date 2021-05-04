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

    static func getURLString(id: Int) -> String? {
        let urls: [String?] = ["Adventure.URL.Sunrise",
                               nil,
                               nil,
                               "Adventure.URL.ParkAttractions",
                               "Adventure.URL.Snowboard",
                               "Adventure.URL.Stars",
                               
                               "Adventure.URL.Horse",
                               "Adventure.URL.RopeJumping",
                               "Adventure.URL.Tents",
                               "Adventure.URL.Waterfall",
                               "Adventure.URL.Cruise",
                               "Adventure.URL.Island",
                               nil,
                               
                               "Adventure.URL.Lights",
                               "Adventure.URL.Surfing",
                               "Adventure.URL.Scuba",
                               "Adventure.URL.SmallPlane",
                               "Adventure.URL.Balloon",
                               "Adventure.URL.Tatoo",
                               "Adventure.URL.Autostop",
                               "Adventure.URL.Parachute"]
        
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
        let urls: [String?] = [nil,
                               "Adventure.INFO.Bet",
                               "Adventure.INFO.NightCity",
                               nil,
                               nil,
                               nil,
                               
                               nil,
                               nil,
                               nil,
                               nil,
                               nil,
                               nil,
                               "Adventure.INFO.Cold",
                               
                               nil,
                               nil,
                               nil,
                               nil,
                               nil,
                               nil,
                               nil,
                               nil]
        
        guard id >= 0 &&
              id <= urls.count else {
            return nil
        }
        
        guard let url = urls[id] else  {
            return nil
        }
        return NSLocalizedString(url, comment: "")

    }


}
