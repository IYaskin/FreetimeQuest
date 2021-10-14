//
//  QuestType.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit

enum Category: Int {
    case goOut
    case good
    case hobby
    case social
    case adventure
}

extension Category {
        
    var cellColor: UIColor {
        switch self {
        case .goOut:
            return UIColor(named: "GoOut.Cell")!
        case .good:
            return UIColor(named: "Good.Cell")!
        case .hobby:
            return UIColor(named: "Hobby.Cell")!
        case .social:
            return UIColor(named: "Social.Cell")!
        case .adventure:
            return UIColor(named: "Adventure.Cell")!
        }
    }
    
    var starColor: UIColor {
        switch self {
        case .goOut:
            return UIColor(named: "GoOut.Star")!
        case .good:
            return UIColor(named: "Good.Star")!
        case .hobby:
            return UIColor(named: "Hobby.Star")!
        case .social:
            return UIColor(named: "Social.Star")!
        case .adventure:
            return UIColor(named: "Adventure.Star")!
        }
    }

    
    var title: String {
        switch self {
        case .goOut:
            return "GoOut"
        case .good:
            return "Good"
        case .hobby:
            return "Hobby"
        case .social:
            return "Social"
        case .adventure:
            return "Adventure"
        }
    }

}
