//
//  Battle.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI
import UIKit
import AVKit

struct BattleSecondView: View {
    @Environment(\.dismiss) var dismiss
    private let player = AVPlayer(url: Bundle.main.url(forResource: "battle_final", withExtension: "mp4")!)
    @State var showingMovie = false
//    var body: some View{
//        Image("Haikei")
//            .resizable()
//            .frame(width: 400, height: 825)
//            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//                        dismiss()
//                    }) {
//                        Text("⬅︎")
//                            .font(.system(size: 70, weight: .medium))
//                            .padding(.bottom)
//                            .frame(width: 70, height: 50)
//                            .background(Color(red: 0.359, green: 0.846, blue: 0.342))
//                            .cornerRadius(10)
//                    }
//                    .offset(y:10)
//                    .foregroundColor(.white)
//                }
//            }
//    }
    var body: some View{
        ZStack{
            Image("Haikei")
                .resizable()
                .frame(width: 400, height: 825)
                .navigationBarBackButtonHidden(true)
            Image("BattleReady")
//                .resizable()
//                .frame(width: 300, height: 165, alignment: .center)
//                .offset(y: -140)
            Button(action: {
                               player.play()
                               showingMovie = true
                           }) {
                               Image("BattleStart2").renderingMode(.original)
                           }
            .offset(y:260)

            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                        player.pause()
                        showingMovie = false
                    }) {
                        Text("⬅️")
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
            if showingMovie {
                VideoPlayer(player: player)
            }
        }

        
    }}

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
