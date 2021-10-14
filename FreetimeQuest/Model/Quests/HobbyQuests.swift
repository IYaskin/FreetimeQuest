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
                                             category: Category.hobby.rawValue)
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

}
