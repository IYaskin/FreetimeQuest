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
    case adventure
    case brain
    case social
    case good
    
    //Additional
    case hobby
    case traveling
    case health
    case liberation
    case charisma
    case food
    //Свои квесты
}

extension Category {
        
    var cellColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .white
        case .good:
            return .lightGray
        case .goOut:
            return .orange
        case .social:
            return .purple
        case .brain:
            return .gray
        case .adventure:
            return .red
        case .hobby:
            return .brown
        case .traveling:
            return .systemTeal
        case .health:
            return .green
        case .liberation:
            return .systemPink
        case .charisma:
            return .black
        case .food:
            return .magenta
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .freetimeQuest, .good, .health, .goOut, .adventure, .liberation, .food:
            return .black
        default:
            return .white
        }
    }
    
    var title: String {
        switch self {
        case .freetimeQuest:
            return "Freetime Quest"
        case .good:
            return "Добро"
        case .goOut:
            return "Посетить места"
        case .social:
            return "Социализация"
        case .brain:
            return "Мозг"
        case .adventure:
            return "Приключения"
        case .hobby:
            return "Хобби"
        case .traveling:
            return "Путешествия"
        case .health:
            return "Здоровье"
        case .liberation:
            return "Раскрепощение"
        case .charisma:
            return "Харизма"
        case .food:
            return "Еда"
        }
    }
    
    var headerTextColor: UIColor {
        switch self {
        case .freetimeQuest, .good, .goOut, .adventure, .health, .liberation, .food:
            return .black
        default:
            return.white
        }
    }
    
    var price: Int {
        switch self {
        case .hobby:
            return 5
        case .traveling:
            return 5
        case .health:
            return 5
        case .liberation:
            return 5
        case .charisma:
            return 5
        case .food:
            return 5
        default:
            return 0
        }
    }


}
