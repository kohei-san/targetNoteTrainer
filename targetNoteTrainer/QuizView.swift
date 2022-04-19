//
//  QuizView.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/04/12.
//

import SwiftUI

struct QuizView: View {
    @AppStorage ("key_note") var keyNote = 0 //C~Bのノート名
    @AppStorage ("key_attr") var keyAttr = 20 //#や♭の記号
    @AppStorage ("key_scale") var keyScale = 30 //使用するスケール
    @AppStorage("target_deg") var targetDeg = 101
    
    @State var answer = 101 // ピッカーで選択する値を代入する変数
    
    @State var QuizNum = 0
    
    var body: some View {


        //        スケールの配列を変数に格納
        let arrayScale  = makeScaleNotesIndex(tagNote: keyNote, tagAttr: keyAttr, tagScale: keyScale)
        let arrayChordHarmonyName = getChordHarmonyName(keyScale: keyScale)
        let indexOfChord = Int.random(in: 0...6)
        
        VStack{
            Text("\(arrayScale[indexOfChord])" + "\(arrayChordHarmonyName[indexOfChord])")
            
            Text("")
            
            Picker(selection: $answer) {
                ForEach(0..<arrayScale.count) {index in
                    Text("\(arrayScale[index])").tag(101 + index)
                }
            }
            label: {
                Text("選択")
            }
            .labelsHidden()
            .pickerStyle(.wheel)
            
            // １０回繰り返すまでは再読み込みを続ける
            if (QuizNum < 10) {
                Button(action: {
                    QuizNum += 1
                    print($targetDeg)
                    print($answer)
                }) {
                    Text("test")
                }
            } else {
                NavigationLink("終了",
                               destination: ContentView())
            }
            
        }
        
        
        
        

    
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
