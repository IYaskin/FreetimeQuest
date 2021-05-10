//
//  QuestType.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit

enum Category: Int {
    case freetimeQuest
    case goOut
    case good
    case hobby
    case social
    case charisma
    case adventure
    case myQuests
}

extension Category {
        
    var cellColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .white
        case .goOut:
            return UIColor(named: "GoOut.Cell")!
        case .good:
            return UIColor(named: "Good.Cell")!
        case .hobby:
            return UIColor(named: "Hobby.Cell")!
        case .social:
            return UIColor(named: "Social.Cell")!
        case .charisma:
            return UIColor(named: "Charisma.Cell")!
        case .adventure:
            return UIColor(named: "Adventure.Cell")!
        case .myQuests:
            return UIColor(named: "My.Cell")!
        }
    }
    
    var starColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .white
        case .goOut:
            return UIColor(named: "GoOut.Star")!
        case .good:
            return UIColor(named: "Good.Star")!
        case .hobby:
            return UIColor(named: "Hobby.Star")!
        case .social:
            return UIColor(named: "Social.Star")!
        case .charisma:
            return UIColor(named: "Charisma.Star")!
        case .adventure:
            return UIColor(named: "Adventure.Star")!
        case .myQuests:
            return UIColor(named: "My.Star")!
        }
    }

    
    var title: String {
        switch self {
        case .freetimeQuest:
            return "Freetime Quest"
        case .goOut:
            return "GoOut"
        case .good:
            return "Good"
        case .hobby:
            return "Hobby"
        case .social:
            return "Social"
        case .charisma:
            return "Charisma"
        case .adventure:
            return "Adventure"
        case .myQuests:
            return "MyQuests"
        }
    }
    
    var price: Int {
        switch self {
        case .freetimeQuest:
            return 0
        case .goOut:
            return 0
        case .good:
            return 1
        case .hobby:
            return 1
        case .social:
            return 1
        case .charisma:
            return 1
        case .adventure:
            return 1
        case .myQuests:
            return 0
        }
    }

}
