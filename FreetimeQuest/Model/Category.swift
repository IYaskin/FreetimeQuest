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
            return .orange
        case .good:
            return .lightGray
        case .hobby:
            return .brown
        case .social:
            return .systemPink
        case .charisma:
            return .blue
        case .adventure:
            return .red
        case .myQuests:
            return .white
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .hobby, .charisma:
            return .white
        default:
            return .black
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
    
    var headerTextColor: UIColor {
        switch self {
        case .hobby, .charisma:
            return .white
        default:
            return .black
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
