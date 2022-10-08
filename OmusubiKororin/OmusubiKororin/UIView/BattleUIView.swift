//
//  BattleView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI
import UIKit

struct BattleTabView: View {
    var body: some View {
        
        NavigationView{
            ZStack {
                Image("Haikei")
                    .resizable()
                    .frame(width: 400, height: 825)
                Image("Battle")
                    .resizable()
                    .frame(width: 300, height: 165, alignment: .center)
                    .offset(y: -140)
                NavigationLink(destination: BattleSecondView()){
                    Image("BattleNear")
                }
                .offset(y:100)
                NavigationLink(destination: BattleFriendView()){
                    Image("BattleFriend")
                }
                .offset(y:200)
            }
        }
    }
}
