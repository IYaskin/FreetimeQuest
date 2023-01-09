//
//  Quests.swift
//  FreetimeQuest
//
//  Created by Игорь Яськин on 14.10.2021.
//

import UIKit

class Quests {
    
    static let quests =
    ["GoOut.Cinema",
     "GoOut.Museum",
     "GoOut.Theater",
     "GoOut.Gallery",
     "GoOut.Zoo",
     "GoOut.SportMatch",
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
     "GoOut.Show",
    
     "Hobby.Chess",
     "Hobby.Backgammon",
     "Hobby.Poker",
     "Hobby.Darts",
     "Hobby.BoardGame",
     "Hobby.Puzzle",
     "Hobby.ComputerGame",
     "Hobby.DrawPicture",
     "Hobby.MoldClay",
     "Hobby.ReadBook",
     "Hobby.LearnPoem",
     "Hobby.MakePhoto",
     "Hobby.NoGadgets",
     "Hobby.Plant",
     "Hobby.FlyKite",
     "Hobby.Cook",
     "Hobby.OrderPortrait",
     "Hobby.FreeSection",
    
     "Good.CarryBag",
     "Good.FeedDuck",
     "Good.PetAnimals",
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
     "Good.FeedHomeless",

     "Social.Smile",
     "Social.Wink",
     "Social.Ugly",
     "Social.Hello",
     "Social.Compliment",
     "Social.Questions",
     "Social.Call",
//     "Social.AskPhoto",
     "Social.Selfie",
     "Social.Oboznalsya",
     "Social.ExchangeNumbers",
     "Social.LoveLetter",
     "Social.TellPoem",
     "Social.Sing",
     "Social.MeetSomeone",
     "Social.AskSalt",
     "Social.Wish",
     "Social.Fountain",
     "Social.Dance",
     "Social.Party",
     "Social.Picnic",
     "Social.Stage",
    
     "Charisma.Teeth",
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
     "Charisma.BadHabit",
    
     "Adventure.Sunrise",
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

    
    static func addQuests() {
        
        UserDefaultsManager.shared.allQuestsCount = 0
        UserDefaultsManager.shared.doneQuestsCount = 0

        for (id, title) in quests.enumerated() {
            let category: Category
            if title.hasPrefix("GoOut") {
                category = .goOut
            } else if title.hasPrefix("Good"){
                category = .good
            } else if title.hasPrefix("Hobby"){
                category = .hobby
            } else if title.hasPrefix("Social"){
                category = .social
            } else if title.hasPrefix("Charisma"){
                category = .charisma
            } else if title.hasPrefix("Adventure"){
                category = .adventure
            } else {
                fatalError()
            }
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: category.rawValue)
        }
        
        UserDefaultsManager.shared.isBaseQuestsSet = true
    }
    
    static let images =
    ["cinema",
     "museum",
     "theater",
     "gallery",
     "zoo",
     "football",
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
     "show",
    
     "chess",
     "nards",
     "poker",
     "darts",
     "tablegame",
     "puzzle",
     "computergame",
     "painting",
     "sculpting",
     "readdetective",
     "memberpoem",
     "photo",
     "nogadgets",
     "plant",
     "kite",
     "cake",
     "portrait",
     "freesection",
    
     "carrybag",
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
     "homeless",
    
     "smile",
     "wink",
     "ugly",
     "hello",
     "compliment",
     "questions",
     "anekdot",
//     "socialphoto",
     "selfie",
     "oboznalsya",
     "exchangenumbers",
     "letter",
     "tellpoem",
     "sing",
     "meetsomeone",
     "salt",
     "wishgoodtrip",
     "fountain",
     "dance",
     "party",
     "picnic",
     "stage",
    
     "teeth",
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
     "badhabit",
     
     "sunrise",
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

    static func getIcon(id: Int) -> UIImage? {

        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
        
    }
    
}
