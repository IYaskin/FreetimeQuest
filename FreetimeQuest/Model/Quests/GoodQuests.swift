//
//  GoodQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class GoodQuests {
    
    static func addQuests() {
        let titles = ["Good.CarryBag",
                      "Good.FeedDuck",
                      "Good.FeedAnimals",
                      "Good.OldStuff",
                      "Good.HelpFond",
                      "Good.Gift",
                      "Good.AppMark",
                      "Good.Blood",
                      "Good.Trash",
                      "Good.HelpBabushka",
                      "Good.BirdHouse",
                      "Good.FamilyDinner",
                      "Good.FeedFriends",
                      "Good.FixHouse",
                      "Good.SteetMusician",
                      "Good.FeedHomeless"]

        for (id, title) in titles.enumerated() {
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.good.rawValue)
        }
        
    }
    
    static func getIcon(id: Int) -> UIImage? {
        let images = ["carrybag",
                      "duck",
                      "animals",
                      "oldstuff",
                      "helpfond",
                      "buygift",
                      "appmark",
                      "blood",
                      "trash",
                      "helpold",
                      "birdhouse",
                      "dinner",
                      "feedfriends",
                      "fixhouse",
                      "musician",
                      "homeless"]
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
    }

}
