//
//  Battle.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI
import UIKit

struct BattleSecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        Image("Haikei")
            .resizable()
            .frame(width: 400, height: 825)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("⬅︎")
                            .font(.system(size: 70, weight: .medium))
                            .padding(.bottom)
                            .frame(width: 70, height: 50)
                            .background(Color(red: 0.359, green: 0.846, blue: 0.342))
                            .cornerRadius(10)
                    }
                    .offset(y:10)
                    .foregroundColor(.white)
                }
            }
    }
}

struct BattleFriendView:View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Image("Haikei")
            .resizable()
            .frame(width: 400, height: 825)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("⬅︎")
                            .font(.system(size: 70, weight: .medium))
                            .padding(.bottom)
                            .frame(width: 70, height: 50)
                            .background(Color(red: 0.359, green: 0.846, blue: 0.342))
                            .cornerRadius(10)
                    }
                    .offset(y:10)
                    .foregroundColor(.white)
                }
            }
    }
}
