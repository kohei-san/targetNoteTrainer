//
//  ListDiatonicChordsView.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/03/06.
//

import SwiftUI

struct ListDiatonicChordsView: View {
    @AppStorage ("key_note") var keyNote = 0 //C~Bのノート名
    @AppStorage ("key_attr") var keyAttr = 20 //#や♭の記号
    @AppStorage ("key_scale") var keyScale = 30 //使用するスケール
    
    
    
    var body: some View {
        //        スケールの配列を変数に格納
        let arrayScale  = makeScaleNotesIndex(tagNote: keyNote, tagAttr: keyAttr, tagScale: keyScale)
        let arrayChordHarmonyName = getChordHarmonyName(keyScale: keyScale)
        //        スケールをリスト表示
        List(0..<arrayScale.count) { note in
            HStack{
                Text(String(note + 1))
                Text(arrayScale[note])
                Text(arrayChordHarmonyName[note])
                
                Spacer()
                
                var chordNotes = takeChordNotesFromArray(root: note, scale: arrayScale, numOfNotes: 4)
                ForEach(chordNotes.indices) { chordIndex in
                    let _ = print(Self._printChanges())
                    Text(chordNotes[chordIndex])
                }
                
                Spacer()
                
                
                
            }
        }
    }
}

struct ListDiatonicChordsView_Previews: PreviewProvider {
    static var previews: some View {
        ListDiatonicChordsView()
    }
}
