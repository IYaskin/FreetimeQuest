//
//  Quests.swift
//  FreetimeQuest
//
//  Created by Игорь Яськин on 14.10.2021.
//

import UIKit

class Quests {
    
    static func addQuests() {
        let titles = ["GoOut.Cinema", "Good.PetAnimals", "Hobby.Chess", "Social.Smile",
                      
                      "GoOut.Zoo", "Good.FeedDuck", "Hobby.Puzzle", "Social.Wink",

                      "GoOut.Karting", "Good.CarryBag", "Hobby.Cook", "Social.Compliment",

                      "GoOut.Museum", "Good.OldStuff", "Hobby.DrawPicture", "Social.Selfie",
                       
                      "GoOut.Bowling", "Good.Gift", "Hobby.BoardGame", "Social.MeetSomeone",
                      
                      "GoOut.Gallery", "Good.FeedFriends", "Hobby.ReadBook", "Social.Dance",
                      
                      "GoOut.SportMatch", "Good.HelpFond", "Hobby.MakePhoto", "Social.Massage",

                      "GoOut.Trampoline", "Good.SteetMusician", "Hobby.LearnPoem", "Social.Fotosession",
                      
                      "GoOut.Concert", "Good.BirdHouse", "Hobby.Plant", "Adventure.Sunrise",
                       
                      "GoOut.StandUp", "GoOut.Theater", "Hobby.FlyKite", "Adventure.NightCity",
                      
                      "Adventure.ParkAttractions", "Adventure.Tents", "Adventure.Horse", "Adventure.Stars",
                      
                      "Adventure.RopeJumping", "Adventure.Tatoo", "Adventure.Snowboard", "Adventure.Balloon",
                      
                      "Adventure.Parachute", "Adventure.Scuba", "Adventure.Surfing", "Adventure.Lights"
                      ]

        for (id, title) in titles.enumerated() {
            print("id = \(id), title = \(title)")
            let category: Category
            if title.hasPrefix("GoOut") {
                category = .goOut
            } else if title.hasPrefix("Good"){
                category = .good
            } else if title.hasPrefix("Hobby"){
                category = .hobby
            } else if title.hasPrefix("Social"){
                category = .social
            } else if title.hasPrefix("Adventure"){
                category = .adventure
            } else {
                fatalError()
            }
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: category.rawValue)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        let images = ["cinema", "animals", "chess", "smile",
                      
                      "zoo", "duck", "puzzle", "wink",

                      "karting", "carrybag", "cake", "compliment",
                      
                      "museum", "oldstuff", "painting", "selfie",
                      
                      "bowling", "buygift", "tablegame", "meetsomeone",
                      
                      "gallery", "feedfriends", "readdetective", "dance",

                      "football", "helpfond", "photo", "massage",
                      
                      "trampoline", "musician", "memberpoem", "photosession",
                      
                      "concert", "birdhouse", "plant", "sunrise",
                      
                      "standup", "theater", "kite", "nightride",
                      
                      "parkattraction", "tents", "horse", "stars",
                       
                      "rope", "tattoo", "snowboard", "balloon",
                      
                      "parachute", "scuba", "surfing", "northernlights"
                      ]

        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
        
    }
    
}
