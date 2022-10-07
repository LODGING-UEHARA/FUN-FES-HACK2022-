//
//  RankingView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI
import UIKit

struct RankingTabView: View {
    var body: some View {
        ZStack {
            Image("Haikei")
                .resizable()
            Text("ランキング").font(.system(size: 50))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}
