//
//  Training_SettingView.swift
//  targetNoteTrainer
//
//  Created by 宮武昂平 on 2022/02/13.
//

import SwiftUI


struct TrainingSettingView: View {
  
    @AppStorage ("key_note") var keyNote = 0 //C~Bのノート名
    @AppStorage ("key_attr") var keyAttr = 20 //#や♭の記号
    @AppStorage ("key_scale") var keyScale = 30 //使用するスケール
    
    
    var body: some View {
        ZStack {
            // 背景色表示
            Color("backgroundSetting")
                .ignoresSafeArea() // セーフエリアを超えて画面全体に配置します
            
            VStack {
//                Spacer() // スペースを空ける
//                Text("スケール選択") // テキストを表示する
//                    .font(.largeTitle) // 文字サイズを指定
                
                
//                task{
//                    root = makeRootNote(intKeyNote: keyNote, intKeyAttr: keyAttr)
//                }
                Spacer() // スペースを空ける
                
                Text(String(makeRootNote(tagNote: keyNote, tagAttr: keyAttr, tagScale: keyScale)))
                
                Spacer() // スペースを空ける
//                
                // ------------- スケールの選択 ----------------------
                HStack {
                    // Pickerを表示
                    // ------ C ~ Bで音を選択 -----------------
                    Picker(selection: $keyNote) {
                        Text("C")
                            .tag(0)
                        Text("D")
                            .tag(2)
                        Text("E")
                            .tag(4)
                        Text("F")
                            .tag(5)
                        Text("G")
                            .tag(7)
                        Text("A")
                            .tag(9)
                        Text("B")
                            .tag(11)
                    } label: {
                        Text("選択")
                    }
                    .frame(width: 100, height: 150)
                    .labelsHidden()
                    .pickerStyle(.wheel)
                    .compositingGroup()
                    .clipped()
                    
                    // Pickerを表示
                    // ------- # or ♭ を選択 --------------------
                    // Notesクラスの音の配列インデックスに一致するようにしている。
                    // keyNotesのtag番号 + keyAttr - 20をすることで配列インデックスと一致する。
                    Picker(selection: $keyAttr) {
                        Text("")
                            .tag(20)
                        Text("#")
                            .tag(21)
                        Text("♭")
                            .tag(19)
                    } label: {
                        Text("選択")
                    }
                    .labelsHidden()
                    .frame(width: 100, height: 150)
                    .pickerStyle(.wheel)
                    .compositingGroup()
                    .clipped()
                } // VStack ここまで
                
                // ------------- スケールの選択 ----------------------
                // Pickerを表示
                // C ~ Bで音を選択
                Picker(selection: $keyScale) {
                    Text("メジャースケール")
                        .tag(30)
                    Text("マイナースケール")
                        .tag(31)
                    Text("ハーモニックマイナー")
                        .tag(32)
                } label: {
                    Text("選択")
                }
                .labelsHidden()
                .frame(height: 120)
                .pickerStyle(.wheel)
                .compositingGroup()
                .clipped()
                
                Spacer() // スペースを空ける
                
                // ---------- ボタン ----------

                NavigationLink("度数選択へ",
                               destination: TargetDegreeSettingView())
                
                NavigationLink("ダイアトニックコード一覧へ",
                               destination: ListDiatonicChordsView())
                
                Spacer() // スペースを空ける
            } // VStack　ここまで
        } // ZStack ここまで
        .navigationBarTitle("スケール設定")
    }
}

struct Training_SettingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSettingView()
    }
}
