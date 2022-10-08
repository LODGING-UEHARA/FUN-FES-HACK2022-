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

public var limitX:CGFloat = 75
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

public var PopupImageX: CGFloat = 0
public var PopupImageY: CGFloat = -70

public var PopupStrY: CGFloat = 130

public var allConerSize:CGFloat = 5




struct LimitView: View {
    let timer = Timer.publish(every: 86400.0, on: .main, in: .common).autoconnect()
    @State var deadDayCount = 3
    @State var finishText:String? = nil
    
    @State var deadHoursCount = 24
    @State var deadDayCountStr: String = "　　3   　日"
    var body: some View {
        ZStack{
            //消費期限の表示
            RoundedRectangle(cornerSize: .init(width: allConerSize, height: allConerSize))
                .fill(Color(red: 0.55, green: 0.799, blue: 0.978))
                .frame(width: RectW, height: RectH)
                .offset(x:OlimitX, y: OlimitY)
            
            Text(deadDayCountStr)
                .fontWeight(.bold)
                .onReceive(timer, perform: { _ in
                    if ((deadDayCount == 3 || deadDayCount == 2) && deadHoursCount > 0){
                        deadDayCountStr = (String(deadDayCount) + "   　  日")
                        deadHoursCount -= 1
                        
                    }else if ((deadDayCount == 3 || deadDayCount == 2) && deadHoursCount == 0){
                        deadDayCountStr = (String(deadDayCount) + "   　  日")
                        deadDayCount -= 1
                        deadHoursCount = 24
                        
                    }else if deadDayCount == 1 && deadHoursCount == 24{
                        //1dayを24hoursへ変更
                        deadDayCount += 23
                        deadDayCountStr = (String(deadDayCount) + "   　時間")
                        deadHoursCount = -1
                        
                    }else if deadDayCount > 1 && deadHoursCount == -1{
                        deadDayCount -= 1
                        deadDayCountStr = (String(deadDayCount) + "   　時間")
                        print(deadHoursCount)
                        // deadHoursCount -= 1
                        //deadDayCountStr = (String(deadDayCount) + " Hours")
                        
                    }else if deadDayCount == 1 && deadHoursCount == -1{
                        deadDayCountStr = "腐にぎり化"
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
    @Binding var d: Double
    
    var body: some View {
        ZStack{
            //ここから育成中のおむすびボタン
            Button(action: {
                withAnimation {
                    showingPopUp = true
                }
            }, label: {
                Image("OnigiriUI")
                    .resizable()
                    .frame(width: OIkuseiWH, height: OIkuseiWH)
                    .cornerRadius(allConerSize)
            })
            .offset(x: OIkuseiX, y: OIkuseiY)
            
            
            if showingPopUp {
                IkuseiOmuPopupView(isPresent: $showingPopUp, TotalLPoint: $d)
            }
        }
    }
}

struct IkuseiOmuPopupView: View {
    @Binding var isPresent: Bool
    @Binding var TotalLPoint: Double
    @State var deadCountStr = ""
    
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
                .frame(width: 150, height: 150)
                .cornerRadius(allConerSize)
                .offset(x: PopupImageX, y: PopupImageY)
            Text("推定エネルギー")
                .font(.system(size: 24))
                .offset(x: -75, y: PopupStrY)
            Text(String(format:"%.1f", TotalLPoint*100))
                .font(.system(size: 24))
                .offset(x: 85, y: PopupStrY)
            Text("cal")
                .font(.system(size: 24))
                .offset(x:150, y: PopupStrY)
            Button {
                print("育成完了")
            } label: {
                Image("IkuseiFin")
                
            }
            .offset(y:260)
            Button(action: {
                withAnimation {
                    isPresent = false
                }
            }, label: {
                Text("×")
                    .font(.system(size: 50))
                
            })
            .offset(x:140, y:-160)
        }
        
    }
}
