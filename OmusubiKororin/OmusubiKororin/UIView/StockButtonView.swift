//
//  StockButtonView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/06.
//

import Foundation
import SwiftUI

struct StockButtonView : View {
    @State var showingPopUp1 = false
    @State var showingPopUp2 = false
    @State var showingPopUp3 = false
    
    public var stockX:CGFloat = 120
    public var stockY:CGFloat = 250
    public var stockWH:CGFloat = 105
    public var allConerSize:CGFloat = 5
    
    var body:some View {
        //ここから手持ちのおむすびボタン3つ
        ZStack{
            
            Button(action: {
                withAnimation {
                    showingPopUp1 = true
                }
            }, label: {
                Image("onigiri00")
                    .resizable()
                    .background(Color(red: 0.55, green: 0.799, blue: 0.978))
                    .frame(width: stockWH, height: stockWH)
                    .cornerRadius(allConerSize)
            })
            .offset(x: -stockX, y: stockY)
            
            Button(action: {
                withAnimation {
                    showingPopUp2 = true
                }
            }, label: {
                Image("onigiri00")
                    .resizable()
                    .background(Color(red: 0.55, green: 0.799, blue: 0.978))
                    .frame(width:stockWH, height:stockWH)
                    .cornerRadius(allConerSize)
            })
            .offset(x: 0*stockX, y: stockY)
            
            Button(action: {
                withAnimation {
                    showingPopUp3 = true
                }
            }, label: {
                Image("onigiri00")
                    .resizable()
                    .background(Color(red: 0.55, green: 0.799, blue: 0.978))
                    .frame(width: stockWH ,height: stockWH)
                    .cornerRadius(5)
            })
            .offset(x: stockX, y: stockY)
            //ここまで
            
            if showingPopUp1 {
                StockOmuPopupView(SisPresent: $showingPopUp1)
            }
            if showingPopUp2 {
                StockOmuPopupView(SisPresent: $showingPopUp2)
            }
            if showingPopUp3 {
                StockOmuPopupView(SisPresent: $showingPopUp3)
            }
        }
    }
}

struct StockOmuPopupView: View {
    @Binding var SisPresent: Bool
    public var RectW:CGFloat = 350
    public var RectH:CGFloat = 510

    public var allConerSize:CGFloat = 5
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: .init(width: allConerSize, height: allConerSize))
                .fill(Color.white)
                .frame(width: RectW, height: RectH, alignment: .center)
                .offset(y:60)
            Button(action: {
                withAnimation {
                    SisPresent = false
                }
            }, label: {
                Text("Close")
            })
//            .frame(width: 280, height: 430, alignment: .center)
            .padding()
//            .background(Color.white)//
//            .cornerRadius(12)
        }
    }
}
