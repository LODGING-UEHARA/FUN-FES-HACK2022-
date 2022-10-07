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
        ZStack {
            Image("Haikei")
                .resizable()
            Text("対戦").font(.system(size: 50))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}
