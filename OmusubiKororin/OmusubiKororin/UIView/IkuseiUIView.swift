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
    @State private var isScrollDisabled = false
    var body: some View {
        ZStack {
            SwiftUIGIFPlayerView(gifName: "YAMAMITI")
            SwiftUIGIFPlayerView(gifName: "onigiri01")
                .frame(width: 300, height: 300)
            Text("標高" + String(altitude ?? 0))
                .font(.system(size: 30))
                .offset(x:0 ,y:-300)
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        //.navigationBarBackButtonHidden(true)
        
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
