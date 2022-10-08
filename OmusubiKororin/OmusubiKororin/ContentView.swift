//
//  ContentView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//
import Foundation
import SwiftUI
import SSSwiftUIGIFView

struct ContentView: View {
    @StateObject var locationViewModel = LocationViewModel()
    @State private var isShowingView: Bool = false
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("Haikei")
                    .resizable()
                    .frame(width: 400, height: 825)
                SwiftUIGIFPlayerView(gifName: "YAMAMITI")
                SwiftUIGIFPlayerView(gifName: "onigiri01")
                    .frame(width: 130,height:130)
                    .offset(x:115,y:40)
                SwiftUIGIFPlayerView(gifName: "onigiri01")
                    .frame(width: 130,height:130)
                    .offset(y:80)
                SwiftUIGIFPlayerView(gifName: "onigiri01")
                    .frame(width: 130,height:130)
                    .offset(x:-115, y:120)
                Image("OMUROGO")
                    .resizable()
                    .frame(width: 370, height: 230, alignment: .center)
                    .offset(y:-150)
                Image("TapStart2")
                    .offset(y:260)
                NavigationLink(destination:GameMain()){
                    HStack(alignment: .bottom) {
                        Image("TapStart")
                    }
                }
                .offset(y:260)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        GameMain()
    }
}


