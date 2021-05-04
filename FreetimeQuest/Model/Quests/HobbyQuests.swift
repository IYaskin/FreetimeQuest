//
//  BrainQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class HobbyQuests {

    static func addQuests() {
        let titles =   ["Hobby.Checkers",
                        "Hobby.Chess",
                        "Hobby.Backgammon",
                        "Hobby.Poker",
                        "Hobby.Darts",
                        "Hobby.BoardGame",
                        "Hobby.Puzzle",
                        "Hobby.ComputerGame",
                        "Hobby.DrawPicture",
                        "Hobby.MoldClay",
                        "Hobby.ReadNovel",
                        "Hobby.ReadDetective",
                        "Hobby.ReadFiction",
                        "Hobby.ReadFantasy",
                        "Hobby.LearnPoem",
                        "Hobby.WritePoem",
                        "Hobby.MakePhoto",
                        "Hobby.NoGadgets",
                        "Hobby.Plant",
                        "Hobby.FlyKite",
                        "Hobby.Cake",
                        "Hobby.Mors",
                        "Hobby.OrderPortrait",
                        "Hobby.FreeSection"]

        
        for (id, title) in titles.enumerated() {
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.hobby.rawValue,
                                             stars: 1)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        
        let images = ["checkers",
                      "chess",
                      "nards",
                      "poker",
                      "darts",
                      "tablegame",
                      "puzzle",
                      "computergame",
                      "painting",
                      "sculpting",
                      "readroman",
                      "readdetective",
                      "readfiction",
                      "readfantasy",
                      "memberpoem",
                      "writepoem",
                      "photo",
                      "nogadgets",
                      "plant",
                      "kite",
                      "cake",
                      "mors",
                      "portrait",
                      "freesection"]
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
    }

    static func getURLString(id: Int) -> String? {
        let urls = ["Hobby.URL.Checkers",
                    "Hobby.URL.Chess",
                    "Hobby.URL.Backgammon",
                    "Hobby.URL.Poker",
                    "Hobby.URL.Darts",
                    "Hobby.URL.BoardGame",
                    "Hobby.URL.Puzzle",
                    "Hobby.URL.ComputerGame",
                    "Hobby.URL.DrawPicture",
                    "Hobby.URL.MoldClay",
                    "Hobby.URL.ReadNovel",
                    "Hobby.URL.ReadDetective",
                    "Hobby.URL.ReadFiction",
                    "Hobby.URL.ReadFantasy",
                    "Hobby.URL.LearnPoem",
                    "Hobby.URL.WritePoem",
                    "Hobby.URL.MakePhoto",
                    "Hobby.URL.NoGadgets",
                    "Hobby.URL.Plant",
                    "Hobby.URL.FlyKite",
                    "Hobby.URL.Cake",
                    "Hobby.URL.Mors",
                    "Hobby.URL.OrderPortrait",
                    "Hobby.URL.FreeSection"]
        
        guard id >= 0 &&
              id <= urls.count else {
            return nil
        }
        
        return NSLocalizedString(urls[id], comment: "")

    }

}
