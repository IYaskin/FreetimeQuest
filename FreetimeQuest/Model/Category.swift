//
//  QuestType.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit

enum Category: Int {
    //Base
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
            return .black
        case .adventure:
            return .red
        case .myQuests:
            return .magenta
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .freetimeQuest, .good, .goOut, .adventure, .social:
            return .black
        default:
            return .white
        }
    }
    
    var title: String {
        switch self {
        case .freetimeQuest:
            return "Freetime Quest"
        case .goOut:
            return "Посетить места"
        case .good:
            return "Добро"
        case .hobby:
            return "Хобби"
        case .social:
            return "Раскрепощение"
        case .charisma:
            return "Саморазвитие"
        case .adventure:
            return "Приключения"
        case .myQuests:
            return "Мои квесты"

        }
    }
    
    var headerTextColor: UIColor {
        switch self {
        case .freetimeQuest, .good, .goOut, .adventure, .social:
            return .black
        default:
            return.white
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
