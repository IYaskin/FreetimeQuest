//
//  Text.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 16.04.2021.
//

import Foundation

class Text {
    
    static let lang = NSLocalizedString("lang", comment: "")

    static var isRussian: Bool {
        return lang == "ru"
    }
    
    static let Ok = NSLocalizedString("Ok", comment: "")
    static let Cancel = NSLocalizedString("Cancel", comment: "")
    
    static let Skip = NSLocalizedString("Skip", comment: "")
    static let Next = NSLocalizedString("Next", comment: "")
    static let Start = NSLocalizedString("Start", comment: "")

    static let DeleteQuest = NSLocalizedString("DeleteQuest", comment: "")
    
    //Onboarding
    static let CompleteQuests = NSLocalizedString("CompleteQuests", comment: "")
    static let AddQuests = NSLocalizedString("AddQuests", comment: "")
    static let CreateMemories = NSLocalizedString("CreateMemories", comment: "")

    static let CompleteQuestsDescription = NSLocalizedString("CompleteQuestsDescription", comment: "")
    static let AddQuestsDescription = NSLocalizedString("AddQuestsDescription", comment: "")
    static let CreateMemoriesDescription = NSLocalizedString("CreateMemoriesDescription", comment: "")

    //Photo
    static let DeletePhoto = NSLocalizedString("DeletePhoto", comment: "")
    static let AddGallery = NSLocalizedString("AddGallery", comment: "")
    static let AddCamera = NSLocalizedString("AddCamera", comment: "")
    static let SetPhoto = NSLocalizedString("SetPhoto", comment: "")
}
