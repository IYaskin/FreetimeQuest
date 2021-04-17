//
//  GoOutQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class GoOutQuests {
    
        
    static func addQuests() {
        let titles = ["GoOut.Museum",
                      "GoOut.Theater",
                      "GoOut.Gallery",
                      "GoOut.Zoo",
                      "GoOut.Football",
                      "GoOut.Basketball",
                      "GoOut.Hockey",
                      "GoOut.Bowling",
                      "GoOut.Billiards",
                      "GoOut.Concert",
                      "GoOut.Quest",
                      "GoOut.IceRink",
                      "GoOut.Karting",
                      "GoOut.Trampoline",
                      "GoOut.Aquapark",
                      "GoOut.Excursion",
                      "GoOut.Degustation",
                      "GoOut.Bar",
                      "GoOut.NightClub",
                      "GoOut.StandUp",
                      "GoOut.Sauna",
                      "GoOut.Show"]
        
        for (id, title) in titles.enumerated() {
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.goOut.rawValue,
                                             stars: 1)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        let images = ["museum",
                      "theater",
                      "gallery",
                      "zoo",
                      "football",
                      "basketball",
                      "hockey",
                      "bowling",
                      "billiard",
                      "concert",
                      "quest",
                      "iceskating",
                      "karting",
                      "trampoline",
                      "aquapark",
                      "excursion",
                      "degustation",
                      "bar",
                      "nightclub",
                      "standup",
                      "sauna",
                      "show"]
        
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
        
    }
    
    static func getURLString(id: Int) -> String? {
        let urls = ["GoOut.URL.Museum",
                    "GoOut.URL.Theater",
                    "GoOut.URL.Gallery",
                    "GoOut.URL.Zoo",
                    "GoOut.URL.Football",
                    "GoOut.URL.Basketball",
                    "GoOut.URL.Hockey",
                    "GoOut.URL.Bowling",
                    "GoOut.URL.Billiards",
                    "GoOut.URL.Concert",
                    "GoOut.URL.Quest",
                    "GoOut.URL.IceRink",
                    "GoOut.URL.Karting",
                    "GoOut.URL.Trampoline",
                    "GoOut.URL.Aquapark",
                    "GoOut.URL.Excursion",
                    "GoOut.URL.Degustation",
                    "GoOut.URL.Bar",
                    "GoOut.URL.NightClub",
                    "GoOut.URL.StandUp",
                    "GoOut.URL.Sauna",
                    "GoOut.URL.Show"]
        
        if id >= 0 && id <= urls.count {
            return NSLocalizedString(urls[id], comment: "")
        } else {
            return nil
        }
        
    }

    
}
