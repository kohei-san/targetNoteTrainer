//
//  Scale.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/03/19.
//

import Foundation

// ================================ ▽スケールの定義 ===================================================


public func majorScale(root: Int) -> Array<Int> {
    let deg_2nd: Int = 2
    let deg_3rd: Int = 4
    let deg_4th: Int = 5
    let deg_5th: Int = 7
    let deg_6th: Int = 9
    let deg_7th: Int = 11

    var arr: Array<Int>
    arr = [
        root,
        minus12IfDegIndexOverflow(num: root + deg_2nd),
        minus12IfDegIndexOverflow(num: root + deg_3rd),
        minus12IfDegIndexOverflow(num: root + deg_4th),
        minus12IfDegIndexOverflow(num: root + deg_5th),
        minus12IfDegIndexOverflow(num: root + deg_6th),
        minus12IfDegIndexOverflow(num: root + deg_7th)
    ]
    return arr
}

public func minorScale(root: Int) -> Array<Int> {
    let deg_2nd: Int = 2
    let deg_3rd: Int = 4
    let deg_4th: Int = 5
    let deg_5th: Int = 7
    let deg_6th: Int = 9
    let deg_7th: Int = 11

    var arr: Array<Int>
    arr = [
        root,
        minus12IfDegIndexOverflow(num: root + deg_2nd),
        minus12IfDegIndexOverflow(num: root + deg_3rd - 1),
        minus12IfDegIndexOverflow(num: root + deg_4th),
        minus12IfDegIndexOverflow(num: root + deg_5th),
        minus12IfDegIndexOverflow(num: root + deg_6th - 1),
        minus12IfDegIndexOverflow(num: root + deg_7th - 1)
    ]
    return arr
}

public func harmonicMinorScale(root: Int) -> Array<Int> {
    let deg_2nd: Int = 2
    let deg_3rd: Int = 4
    let deg_4th: Int = 5
    let deg_5th: Int = 7
    let deg_6th: Int = 9
    let deg_7th: Int = 11

    var arr: Array<Int>
    arr = [
        root,
        minus12IfDegIndexOverflow(num: root + deg_2nd),
        minus12IfDegIndexOverflow(num: root + deg_3rd - 1),
        minus12IfDegIndexOverflow(num: root + deg_4th),
        minus12IfDegIndexOverflow(num: root + deg_5th),
        minus12IfDegIndexOverflow(num: root + deg_6th - 1),
        minus12IfDegIndexOverflow(num: root + deg_7th)
    ]
    return arr

}
