//
//  IkuseiView.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI
import CoreLocation
import UIKit

struct IkuseiTabView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack {
            Text("標高" + String(altitude ?? 0)).font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
