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
            
            //1
            Image("OmuUIBack")
                .resizable()
                .frame(width: stockWH, height: stockWH)
                .offset(x: -stockX, y: stockY)
            Button(action: {
                withAnimation {
                    showingPopUp1 = true
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
                    showingPopUp2 = true
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
            
            if showingPopUp1 {
                StockOmuPopupView(SisPresent: $showingPopUp1)
            }
            if showingPopUp2 {
                StockOmuPopupView(SisPresent: $showingPopUp2)
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
                    SisPresent = false
                }
            }, label: {
                Text("×")
                    .font(.system(size: 50))
            })
            .offset(x:140, y:-160)
        }
    }
}

