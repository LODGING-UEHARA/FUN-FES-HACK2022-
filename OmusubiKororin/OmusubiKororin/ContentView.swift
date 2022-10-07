//
//  ContentView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        NavigationView{
            NavigationLink(destination:GameMain()){
                HStack(alignment: .bottom) {
                    //Image
                    Text("Title")
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        GameMain()
    }
}

