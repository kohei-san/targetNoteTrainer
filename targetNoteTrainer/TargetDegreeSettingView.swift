//
//  TargetDegreeSettingView.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/02/17.
//

import SwiftUI

struct TargetDegreeSettingView: View {
    @AppStorage("target_deg") var targetDeg = 101
    
    var body: some View {
        VStack{
            
            Picker(selection: $targetDeg) {
                Text("3rd")
                    .tag(103)
                Text("5th")
                    .tag(105)
                Text("7th")
                    .tag(107)
                Text("2nd(9th)")
                    .tag(102)
                Text("4th(11th)")
                    .tag(104)
                Text("6th(13th)")
                    .tag(106)
            } label: {
                Text("選択")
            }
            .labelsHidden()
            .pickerStyle(.wheel)
            
            // ---------- ボタン ----------
            NavigationLink("スタート",
                           destination: QuizView())
            
            
        }
    }
}

struct TargetDegreeSettingView_Previews: PreviewProvider {
    static var previews: some View {
        TargetDegreeSettingView()
    }
}
