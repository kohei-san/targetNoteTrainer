//
//  ContentView.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/02/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink("ターゲットノートトレーニング"
                               ,destination: TrainingSettingView())
                
                NavigationLink("ダイアトニックコード確認"
                               ,destination: TrainingSettingView())
                
            }
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
