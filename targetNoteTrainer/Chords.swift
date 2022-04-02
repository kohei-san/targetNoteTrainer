//
//  Chords.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/03/29.
//

import Foundation

public func takeChordNotesFromArray(root: Int, scale: Array<String>, numOfNotes: Int)->Array<String> {
//    和音を生成するメソッド
//    root,,,,,,,,コードのルート音のインデックス
//    scale,,,,,,,生成されたスケールの配列(７音)
//    numOfNotes,,和音数
    var arr: Array<String> = []
    var i: Int = 0
    while i < numOfNotes {
//        arr.append(scale[root + i * 2])
        arr.append(scale[minusNumOfContents_IfIndexOverflow(numOfContents: scale.count, index: root + i * 2)])
        i += 1
    }
    
    
    return arr
}

public func getChordHarmonyName(keyScale: Int) -> Array<String> {
    switch keyScale{
//        マイナー
    case 31 : return ["m7", "m7♭5", "△7", "m7", "m7", "△7", "7"]
        
//        ハーモニックマイナー
    case 32 : return ["m△7", "m7♭5", "△7#5", "m7", "7", "△7", "dim"]
//        メジャー
    default : return ["△7", "m7", "m7", "△7", "7", "m7", "m7♭5"]
    }
}

// スケールやコードトーン生成時に、度数のインデックスが11を超えると11を引いて返す
public func minusNumOfContents_IfIndexOverflow (numOfContents: Int, index: Int)-> Int {
    if (index > numOfContents - 1 ) {
        return index - numOfContents
    }
    // 11未満はそのまま返す
    return index
}
