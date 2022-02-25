//
//  Sound.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 05.06.2021.
//

import Foundation
import AudioToolbox

class Sound {
    static func playGoodMusic(id: Int) {
        switch id {
        case 1:
            SystemSoundID.playFileNamed(fileName: "1", withExtenstion: "mp3")
        case 2:
            SystemSoundID.playFileNamed(fileName: "2", withExtenstion: "mp3")
        case 3:
            SystemSoundID.playFileNamed(fileName: "3", withExtenstion: "mp3")
        default:
            break
        }
    }
    
    static func playBadMusic() {
        SystemSoundID.playFileNamed(fileName: "4", withExtenstion: "mp3")
    }

}
