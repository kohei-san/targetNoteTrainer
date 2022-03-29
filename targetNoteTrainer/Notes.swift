//
//  Notes.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/02/13.
//

import Foundation
import SwiftUI


//テスト
public func test () ->String {
    return "a"
}


// =================================== 12音階がflatかsharpかを判別し、１２音階を返す =================================================
//▽選択しているスケールとルート音によって、使用する12音階を変更するメソッド
func selectNotes(tagScale: Int, root: Int) ->Array<String> {
    var arrToReturn: Array<String>// 返り値となる変数
    if (root == 5 && tagScale == 30) { // キーFのメジャーはあああ
        arrToReturn = flatNotes()
        
    } else if (root == 2 && tagScale == 31) {
        arrToReturn = flatNotes()
        
    } else if  (root == 10 && tagScale == 31) {
        arrToReturn = flatNotes()
        
    } else if (tagScale == 30) {
        arrToReturn = flatNotes()
        
    } else if (tagScale == 31) {
        arrToReturn = sharpNotes()
        
    } else if (tagScale == 32) {
        arrToReturn = sharpNotes()
        
    } else {
        arrToReturn = sharpNotes()
    }
    
    return arrToReturn
}
//△選択しているスケールとルート音によって、使用する12音階を変更するメソッド
// =================================== 12音階がflatかsharpかを判別し、１２音階を返す ================================================












// =================================================================================================
//コードを出力する関数
//public func printChordNotes (notes: Array<String>, chordNotes: Array<Int>) {
//    for chordNote in chordNotes {
//        if (chordNote < 12) {
//            print(notes[chordNote])
//        } else {
//            print(notes[chordNote - 12])// for inで使用している単体の変数は、letで定義されているため都度計算する必要がある。
//        }
//    }
//}

// 音名のインデックス管理を1ｵｸﾀｰﾌﾞ内に止めるためのメソッド
// スケールやコードトーン生成時に、度数のインデックスが11を超えると11を引いて返す
public func minus12IfDegIndexOverflow (num: Int)-> Int {
    if (num > 11) {
        return num - 12
    }
    // 11未満はそのまま返す
    return num
}
// =============================== コードの定義▼ =====================================================

class Chords {
    
    var notes: [Int]!   //返り値を格納する配列
    // 各コードノートの基本の度数
    let deg_2nd: Int = 2
    let deg_3rd: Int = 4
    let deg_4th: Int = 5
    let deg_5th: Int = 7
    let deg_6th: Int = 9
    let deg_7th: Int = 11
    // ======================================================================= アプリに残すのはこれだけになるかも
    // スケールとルートを渡すと、4和音を配列で返す（）
    func makeCodeFromScale (scale: Array<Int>, root: Int, numOfNotes: Int) -> Array<Int> {
        var arr: Array<Int>
        arr = []
        for i in 0...3 {
            if (root + i * 2 < numOfNotes) {
                arr += [scale[root + i * 2 ]]
            } else {
                arr += [scale[root + i * 2 - numOfNotes ]]
            }
        }
        return arr
    }
    
    // ======================================================================
    // メジャーコードの構成音を返す
    func majorChord (root: Int) -> [Int] {
        notes = [root, root + deg_3rd, root + deg_5th, root + deg_7th]
        return notes
    }
    
    // マイナーコードの構成音を返す
    func minorChord (root: Int) -> [Int] {
        notes = [root, root + deg_3rd - 1, root + deg_5th, root + deg_7th - 1]
        return notes
    }
    
    // m7-5thコードの構成音を返す
    func m7th_flat5thChord (root: Int) -> [Int] {
        notes = [root, root + deg_3rd - 1, root + deg_5th - 1, root + deg_7th - 1]
        return notes
    }
    
    // dimコードの構成音を返す
    func dimChord (root: Int) -> [Int] {
        notes = [root, root + deg_3rd - 1, root + deg_5th - 1, root + deg_6th]
        return notes
    }
}
// ================================　コードの定義　====================================================




//引数：ルート音、ルート音記号、スケール
//返り値：スケールノートの配列
public func makeScaleNotesIndex(tagNote: Int, tagAttr:Int, tagScale:Int) ->Array<String> {
    //    ルート音のインデックスを求める
    let root = tagNote + tagAttr - 20

    //    使用する音階を決定する
    var arrNotes: Array<String>
    arrNotes = selectNotes(tagScale: tagScale, root: root)
    
    //    音階のインデックスを生成する関数を呼び出す
    var arrScaleIndex: Array<Int>
    
    switch tagScale {
    case 31 : arrScaleIndex = minorScale(root: root)
        
    case 32 : arrScaleIndex = harmonicMinorScale(root: root)
        
    default : arrScaleIndex = majorScale(root: root)
    }
    
    //    12音階からスケールの配列を取り出す
//    var key: Int = 0
//    var arrScaleNotes: [Int: String] = [key: ""]
//    for index in arrScaleIndex {
//        arrScaleNotes[key] = arrNotes[minus12IfDegIndexOverflow(num: index)]
//        key += 1
//    }
//
    
    var arrScaleNotes = [String]()
    for index in arrScaleIndex {
        arrScaleNotes.append(arrNotes[minus12IfDegIndexOverflow(num: index)])
    }

    
    return arrScaleNotes
}


func flatNotes () -> Array<String> {
    return ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
}

func sharpNotes () -> Array<String> {
    return ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
}
// =================================== △12音階がflatかsharpかを判別し、１２音階を返す =================================================

//セッティング画面で送信したtagを元に、ルート音のインデックスを出力するメソッド
public func makeRootNote(tagNote: Int, tagAttr:Int, tagScale:Int)-> String {
    let intRoot:Int = tagNote + tagAttr - 20
    //    スケール選択のtagによって、使用する１２音階（# or ♭）を返す
    let notes:Array<String> = selectNotes(tagScale: tagScale, root: intRoot)
    //    使用する１２音階の配列からルート音を選択する。
    //    インデックスの値が、12音階の外に出てしまった場合はエラーメッセージを返す
    if intRoot < 0 || intRoot > 11 {
        return "この音は選択できません"
    } else {
        //      tagNote, tagAttrよりインデックスを導き、それをルート音とする
        return notes[tagNote + tagAttr - 20]
    }
    
}


// ================================ △スケールの定義 ===================================================


