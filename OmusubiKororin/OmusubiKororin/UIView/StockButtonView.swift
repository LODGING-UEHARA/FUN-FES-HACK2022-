//
//  StockButtonView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/06.
//

import Foundation
import SwiftUI

struct StockButtonView : View {
    public var stockX:CGFloat = 10
    public var stockY:CGFloat = 250
    public var stockWH:CGFloat = 105
    public var allConerSize:CGFloat = 5
    
    var body:some View {
        //ここから手持ちのおむすびボタン3つ
        HStack{
            Button(action: {
                print("鬼斬り")
            }){
                Image("onigiri00")
                    .resizable()
                    .background(Color(red: 0.55, green: 0.799, blue: 0.978))
                    .frame(width: stockWH, height: stockWH)
                    .cornerRadius(allConerSize)
            }
            .offset(x: -stockX, y: stockY)
            
            Button(action: {
                print("鬼斬り")
            }){
                Image("onigiri00")
                    .resizable()
                    .background(Color(red: 0.55, green: 0.799, blue: 0.978))
                    .frame(width:stockWH, height:stockWH)
                    .cornerRadius(allConerSize)
            }
            .offset(x: 0*stockX, y: stockY)
            
            Button(action: {
                print("鬼斬り")
            }){
                Image("onigiri00")
                    .resizable()
                    .background(Color(red: 0.55, green: 0.799, blue: 0.978))
                    .frame(width: stockWH ,height: stockWH)
                    .cornerRadius(5)
            }
            .offset(x: stockX, y: stockY)
            //ここまで
        }
    }
}
