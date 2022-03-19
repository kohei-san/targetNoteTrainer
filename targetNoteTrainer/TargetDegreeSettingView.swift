//
//  TargetDegreeSettingView.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/02/17.
//

import SwiftUI

struct TargetDegreeSettingView: View {
    @AppStorage("target_deg") var targetDeg = 40
    
    var body: some View {
        VStack{
            
            Picker(selection: $targetDeg) {
                Text("3rd")
                    .tag(40)
                Text("5th")
                    .tag(41)
                Text("7th")
                    .tag(42)
                Text("2nd(9th)")
                    .tag(43)
                Text("4th(11th)")
                    .tag(44)
                Text("6th(13th)")
                    .tag(45)
            } label: {
                Text("選択")
            }
            .labelsHidden()
            .pickerStyle(.wheel)
            
            // ---------- ボタン ----------
            NavigationLink("スタート",
                           destination: ContentView())
            
            
        }
    }
}

struct TargetDegreeSettingView_Previews: PreviewProvider {
    static var previews: some View {
        TargetDegreeSettingView()
    }
}
