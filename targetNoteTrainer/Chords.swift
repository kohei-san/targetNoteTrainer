//
//  Chords.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/03/29.
//

import Foundation

public func takeChordNotesFromArray(root: Int, scale: Array<String>, numOfNotes: Int)->Array<String> {
    return ["A", "B", "C"]
}

public func getChordHarmonyName(keyScale: Int) -> Array<String> {
    switch keyScale{
    case 31 : return ["m7", "m7♭5", "△7", "m7", "m7", "△7", "7"]
        
    case 32 : return ["m7", "m7♭5", "△7", "m7", "m7", "△7", "7"]
        
    default : return ["△7", "m7", "m7", "△7", "7", "m7", "m7♭5"]
    }
}
