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
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(red: 0.359, green: 0.846, blue: 0.342))
        //非選択中のタブの色を代入
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.white)
        }
    var body: some View {
        //let screenSizeHeight = UIScreen.main.bounds.height
        TabView(selection: $selectTab) {
            IkuseiTabView()
                .tabItem{
                    Image(systemName: "capslock.fill")
                    Text("育成")
                }.tag(1)
                .environmentObject(locationViewModel)
            BattleTabView()
                .tabItem{
                    Image(systemName: "flag.filled.and.flag.crossed")
                    Text("対戦")
                }.tag(2)
            RankingTabView()
                .tabItem{
                    Image(systemName: "crown")
                    Text("ランキング")
                }.tag(3)
        }
//        .tabViewStyle(.page)
        .accentColor(.black)
        
//        .frame(maxHeight: screenSizeHeight)
//        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

