//
//  StockButtonView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/06.
//

import Foundation
import SwiftUI

struct StockButtonView : View {
    @State var showingPopUp1 = 1
    @State var showingPopUp2 = 3
    
    public var stockX:CGFloat = 120
    public var stockY:CGFloat = 250
    public var stockWH:CGFloat = 105
    public var allConerSize:CGFloat = 5
    
    var body:some View {
        //ここから手持ちのおむすびボタン3つ
        ZStack{
            
            //1
            Image("OmuUIBack")
                .resizable()
                .frame(width: stockWH, height: stockWH)
                .offset(x: -stockX, y: stockY)
            Button(action: {
                withAnimation {
                    showingPopUp1 += 1
                }
            }, label: {
                ZStack{
                    Image("OnigiriUI")
                        .resizable()
                        .frame(width: stockWH, height: stockWH)
                        .cornerRadius(allConerSize)
                    Image("tunamayo")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .offset(x:30,y:-33)
                }
            })
            .offset(x: -stockX, y: stockY)
            
            //2
            Image("OmuUIBack")
                .resizable()
                .frame(width: stockWH, height: stockWH)
                .offset(x: 0*stockX, y: stockY)
            Button(action: {
                withAnimation {
                    showingPopUp2 += 1
                }
            }, label: {
                ZStack{
                    Image("OnigiriUI")
                        .resizable()
                        .frame(width:stockWH, height:stockWH)
                        .cornerRadius(allConerSize)
                    Image("ume")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .offset(x:30,y:-33)
                }
            })
            .offset(x: 0*stockX, y: stockY)
            
            //3
            Image("OmuUIBack")
                .resizable()
                .frame(width: stockWH, height: stockWH)
                .offset(x: stockX, y: stockY)
            
            if showingPopUp1 == 2  {
                StockOmuPopupView(SisPresent: $showingPopUp1)
            }
            if showingPopUp2 == 4 {
                StockOmuPopupView(SisPresent: $showingPopUp2)
            }
        }
    }
}

struct StockOmuPopupView: View {
    @Binding var SisPresent: Int
    public var RectW:CGFloat = 350
    public var RectH:CGFloat = 510
    public var allConerSize:CGFloat = 5
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: .init(width: allConerSize, height: allConerSize))
                .fill(Color.white)
                .frame(width: RectW, height: RectH, alignment: .center)
                .offset(y:60)
            if SisPresent == 2 {
                Image("tunamayo")
                    .resizable()
                    .frame(width: 60, height:60)
                    .offset(x:-120, y:-130)
                Image("tunamayo")
                    .resizable()
                    .frame(width: 45, height:45)
                    .offset(x:120, y:80)
                Text("おにぎりの具")
                    .font(.system(size: 24))
                    .offset(x:-70, y:80)
                Text("エネルギー")
                    .font(.system(size: 24))
                    .offset(x:-81, y:150)
                Text("9162　cal")
                    .font(.system(size: 24))
                    .offset(x:90,y:150)
            } else if SisPresent == 4 {
                Image("ume")
                    .resizable()
                    .frame(width: 60, height:60)
                    .offset(x:-120, y:-130)
                Image("ume")
                    .resizable()
                    .frame(width: 45, height:45)
                    .offset(x:120, y:80)
                Text("おにぎりの具")
                    .font(.system(size: 24))
                    .offset(x:-70, y:80)
                Text("エネルギー")
                    .font(.system(size: 24))
                    .offset(x:-81, y:150)
                Text("530000　cal")
                    .font(.system(size: 24))
                    .offset(x:90,y:150)
            }
            Image("onigiri00")
                .resizable()
                .frame(width: 150, height:150)
                .offset(y:-70)
            Button {
                print("捨てました")
            } label: {
                Image("StockTra")
                    
            }
            .offset(y:260)
            
            Button(action: {
                withAnimation {
                    SisPresent = SisPresent - 1
                }
            }, label: {
                Text("×")
                    .font(.system(size: 50))
            })
            .offset(x:140, y:-160)
        }
    }
}

