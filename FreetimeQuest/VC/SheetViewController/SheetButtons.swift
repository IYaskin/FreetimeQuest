//
//  SheetButtons.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 16.04.2021.
//

import Foundation

enum SheetButtons {
    case addPhotoFromCamera
    case addPhotoFromGallery
    case deletePhoto

    
    var title: String {
        switch self {
        case .addPhotoFromCamera:
            return NSLocalizedString("Sheet.AddCamera", comment: "") 
        case .addPhotoFromGallery:
            return NSLocalizedString("Sheet.AddGallery", comment: "")
        case .deletePhoto:
            return NSLocalizedString("Sheet.DeletePhoto", comment: "")
        }
    }
}
