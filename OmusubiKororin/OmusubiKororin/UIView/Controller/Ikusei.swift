//
//  Ikusei.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI
import UIKit

public var OlimitX:CGFloat = 55
public var OlimitY:CGFloat = -240

public var limitX:CGFloat = 55
public var limitY:CGFloat = -240

public var OIkuseiX:CGFloat = -125
public var OIkuseiY:CGFloat = -280
public var OIkuseiWH:CGFloat = 100

public var HyokouX:CGFloat = 55
public var HyokouY:CGFloat = -320

public var TextX1:CGFloat = 5
public var TextX2:CGFloat = 115
public var TextX3:CGFloat = 160
public var TextX4:CGFloat = -15

public var RectW:CGFloat = 240
public var RectH:CGFloat = 70

public var allConerSize:CGFloat = 5

struct LimitView: View {
    let timer = Timer.publish(every: 86400.0, on: .main, in: .common).autoconnect()
    @State var deadDayCount = 3
    @State var finishText:String? = nil
    
    var body: some View {
        ZStack{
            //消費期限の表示
            RoundedRectangle(cornerSize: .init(width: allConerSize, height: allConerSize))
                .fill(Color(red: 0.55, green: 0.799, blue: 0.978))
                .frame(width: RectW, height: RectH)
                .offset(x:OlimitX, y: OlimitY)
            
            Text((finishText) ?? "\(deadDayCount)")
                .fontWeight(.bold)
                .onReceive(timer, perform: { _ in
                    if deadDayCount == 0 {
                        finishText = "腐にぎり化"
                    }else{
                        deadDayCount -= 1
                    }
                })
                .font(.system(size: 30))
                .offset(x:limitX , y: limitY)
            Text("消費期限:")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .offset(x: TextX4, y: limitY )
        }
    }
}

struct HyoukoUIView: View {
    
    var body: some View {
        ZStack{
            //ここから「登った高さの表示」
            RoundedRectangle(cornerSize: .init(width: allConerSize, height: allConerSize))
                .fill(Color(red: 0.55, green: 0.799, blue: 0.978))
                .frame(width: RectW, height: RectH)
                .offset(x: HyokouX, y: HyokouY)
            Text("登った高さ：")
                .font(.system(size: 20))
                .fontWeight(.bold)
            //                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .offset(x: TextX1, y: HyokouY)
            Text("m")
                .font(.system(size: 22))
                .fontWeight(.bold)
            //                .foregroundColor(Color.black)
                .multilineTextAlignment(.trailing)
                .offset(x: TextX3, y:HyokouY)
        }
    }
}

struct IkuseiOmuUIView: View {
    @State var showingPopUp = false
    
    var body: some View {
        ZStack{
            //ここから育成中のおむすびボタン
            Button(action: {
                withAnimation {
                    showingPopUp = true
                }
            }, label: {
                Image("onigiri00")
                    .resizable()
                    .background(Color(red: 0.55, green: 0.799, blue: 0.978))
                    .frame(width: OIkuseiWH, height: OIkuseiWH)
                    .cornerRadius(allConerSize)
            })
                .offset(x: OIkuseiX, y: OIkuseiY)
            
            
            if showingPopUp {
                IkuseiOmuPopupView(isPresent: $showingPopUp)
            }
        }
    }
}

struct IkuseiOmuPopupView: View {
    @Binding var isPresent: Bool
    
    public var RectW:CGFloat = 350
    public var RectH:CGFloat = 600

    public var allConerSize:CGFloat = 5
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: .init(width: allConerSize, height: allConerSize))
                .fill(Color.white)
                .frame(width: RectW, height: RectH, alignment: .center)
                .offset(y:105)
            Button(action: {
                withAnimation {
                    isPresent = false
                }
            }, label: {
                Text("Close")
            })
        }
//        .frame(width: 280, height: 430, alignment: .center)
        .padding()
//        .background(Color.white)
        .cornerRadius(12)
    }
}
