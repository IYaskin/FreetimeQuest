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
    
    case changePhotoWithCamera
    case changePhotoWithGallery

    case deletePhoto
    case deleteMemory
    
    var title: String {
        switch self {
        case .addPhotoFromCamera:
            return "Добавить фото с камеры"
        case .addPhotoFromGallery:
            return "Добавить фото с галереи"
        case .changePhotoWithCamera:
            return "Изменить на фото с камеры"
        case .changePhotoWithGallery:
            return "Изменить на фото из галереи"
        case .deletePhoto:
            return "Удалить фото"
        case .deleteMemory:
            return "Удалить воспоминание"
        }
    }
}
