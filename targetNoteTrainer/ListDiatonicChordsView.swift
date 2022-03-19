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
        List(makeScaleNotesIndex(tagNote: keyNote, tagAttr: keyAttr, tagScale: keyScale), id: \.self) { note in
                HStack{
                    Text(note)
                }
            }
        }
    }

struct ListDiatonicChordsView_Previews: PreviewProvider {
    static var previews: some View {
        ListDiatonicChordsView()
    }
}
