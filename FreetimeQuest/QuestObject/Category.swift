//
//  QuestType.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit

enum Category: Int {
    case good
    case goOut
    case social
    case brain
    case adventure
}

extension Category {
    var bgColor: UIColor {
        switch self {
        case .good:
            return .lightGray
        case .goOut:
            return .orange
        case .social:
            return .blue
        case .brain:
            return .gray
        case .adventure:
            return .red
        }
    }
    
    var title: String {
        switch self {
        case .good:
            return "Добро"
        case .goOut:
            return "Выход в свет"
        case .social:
            return "Социализация"
        case .brain:
            return "Мозг"
        case .adventure:
            return "Приключения"
        }
    }
    
    var description: String {
        switch self {
        case .good:
            return "Добро"
        case .goOut:
            return "А че дома делать?"
        case .social:
            return "Социализация"
        case .brain:
            return "Мозг"
        case .adventure:
            return "Приключения"
        }
    }


}
