//
//  Note.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/03/19.
//

import Foundation

// 次のコードを決定するインデックスを「前回と重複しないように」決定する。
// 重複した場合はやり直している
public func nextIndex(index: Int) -> Int {
    var newIndex = 0
    repeat {
        newIndex = Int.random(in: 0...6) // コードを選択するためのインデックスを生成
    } while index == newIndex
    
    return newIndex
}
