//
//  GameMain.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/04.
//

import Foundation
import SwiftUI

struct GameMain: View {
    @State var selectTab = 1
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        let screenSizeHeight = UIScreen.main.bounds.height
        TabView(selection: $selectTab) {
            IkuseiTabView()
                .tabItem{Text("育成")}.tag(1)
                .environmentObject(locationViewModel)
            BattleTabView()
                .tabItem{Text("バトル")}.tag(2)
            RankingTabView()
                .tabItem{Text("ランキング")}.tag(3)
        }
        .frame(maxHeight: screenSizeHeight)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

