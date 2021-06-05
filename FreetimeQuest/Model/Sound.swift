//
//  Sound.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 05.06.2021.
//

import Foundation
import AudioToolbox

class Sound {
    static func playDoneQuest() {
        SystemSoundID.playFileNamed(fileName: "done", withExtenstion: "mp3")
    }
    
    static func playDeleteQuest() {
        SystemSoundID.playFileNamed(fileName: "delete", withExtenstion: "mp3")
    }
    
    static func playAddCategory() {
        SystemSoundID.playFileNamed(fileName: "category", withExtenstion: "mp3")
    }
    
    static func playCreateGIF() {
        SystemSoundID.playFileNamed(fileName: "GIF", withExtenstion: "mp3")
    }


}
