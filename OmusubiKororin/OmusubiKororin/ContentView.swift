//
//  ContentView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI

struct ContentView: View {
    @State var selectTab = 1
    
    var body: some View {
        TabView(selection: $selectTab) {
            IkuseiTabView().tabItem{(Text("育成"))}.tag(1)
            BattleTabView().tabItem{Text("バトル")}.tag(2)
            RankingTabView().tabItem{Text("ランキング")}.tag(3)
            
        }
    }
}

struct IkuseiTabView: View {
    var body: some View {
        VStack {
            Text("育成").font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct BattleTabView: View {
    var body: some View {
        VStack {
            Text("バトル").font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct RankingTabView: View {
    var body: some View {
        VStack {
            Text("ランキング").font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        IkuseiTabView()
        BattleTabView()
        RankingTabView()
    }
}

