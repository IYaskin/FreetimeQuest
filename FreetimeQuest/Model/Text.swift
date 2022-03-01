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
    

    static let DeleteQuest = NSLocalizedString("DeleteQuest", comment: "")
    static let Notes = NSLocalizedString("Notes", comment: "")
    static let Copyright = "\n©FreetimeQuest"

    //Onboarding
    static let Hello = NSLocalizedString("Hello", comment: "")
    static let OnboardingText = NSLocalizedString("OnboardingText", comment: "")
    static let Start = NSLocalizedString("Start", comment: "")

    //Photo
    static let DeletePhoto = NSLocalizedString("DeletePhoto", comment: "")
    static let AddGallery = NSLocalizedString("AddGallery", comment: "")
    static let AddCamera = NSLocalizedString("AddCamera", comment: "")
    static let SetPhoto = NSLocalizedString("SetPhoto", comment: "")
    static let FailPhoto = NSLocalizedString("FailPhoto", comment: "")

    //Share
    static let ShareUndoneTextStart = NSLocalizedString("ShareUndoneTextStart", comment: "")
    static let ShareUndoneTextEnd = NSLocalizedString("ShareUndoneTextEnd", comment: "")
    static let ShareDoneText = NSLocalizedString("ShareDoneText", comment: "")

}
