//
//  IkuseiView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI
import CoreLocation
import UIKit
import SSSwiftUIGIFView

struct IkuseiTabView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    //各種座標と幅、高さ
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
    public var TextX2:CGFloat = 105
    public var TextX3:CGFloat = 160
    public var TextX4:CGFloat = -15

    public var RectW:CGFloat = 240
    public var RectH:CGFloat = 65
    
    //
    @State private var count = 5
    @State private var beforeAltitude = 0.0
    @State private var afterAltitude = 0.0
    @State private var locationPoint = 0.0
    @State private var totalLocationPoint = 0.0
    @State private var isCountDown = true
    
    
    var body: some View {
        ZStack {
            Image("Haikei")
                .resizable()
            SwiftUIGIFPlayerView(gifName: "YAMAMITI")
            SwiftUIGIFPlayerView(gifName: "onigiri01")
                .frame(width: 300, height: 300)
            
            OmusubiUIView()
            Text(String(format:"%.2f",totalLocationPoint))
                .font(.system(size: 22))
                .fontWeight(.bold)
//                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .offset(x: TextX2, y:HyokouY)
                .onAppear(){
                    // 1.0秒おきに{}内を繰り返す
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {timer in
                        if self.count == 5 {
                            self.count -= 1
                            beforeAltitude = Double(altitude ?? 0)
                            print(beforeAltitude)
                            
                        }else if self.count == 0{
                            afterAltitude = Double(altitude ?? 0)
                            //任意の秒数間の標高の差
                            locationPoint = afterAltitude - beforeAltitude
                            locationPoint = (ceil(locationPoint * 100) / 100)
                            
                            print(locationPoint)
                            print(afterAltitude)
                            
                            if locationPoint >= 0{
                                totalLocationPoint += locationPoint
                            }else{
                                locationPoint = 0.0
                            }
                            // 現在のカウントが0になったらtimerを終了させ、カントダウン終了状態に更新
                            //timer.invalidate()
                            
                            self.count = 5
                            //self.isCountDown = false
                        }else{
                            self.count -= 1
                        }
                    }
                }
            //賞味期限の表示とUI
            LimitView()
            //ストックのおむすびボタンの表示
            StockButtonView()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    
    
    var altitude: CLLocationDistance? {
        locationViewModel.newLocation?.altitude
    }
}
struct Ikusei_Previews: PreviewProvider {
    static var previews: some View {
        IkuseiTabView()
            .environmentObject(LocationViewModel())
    }
}
