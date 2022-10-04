//
//  OmusubiKororinApp.swift
//  OmusubiKororin
//
//  Created by 児玉拓海 on 2022/10/03.
//

import SwiftUI
import CoreLocation

@main
struct OmusubiKororinApp: App {
    //AppDelegateを設定できるようにする
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate{
    var locationManager : CLLocationManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager!.desiredAccuracy = kCLLocationAccuracyBest //最高精度
            //locationManager!.distanceFilter = 10
            locationManager!.allowsBackgroundLocationUpdates = true //バックグラウンド処理を可能にする
            locationManager!.pausesLocationUpdatesAutomatically = false //ポーズしても位置取得を続ける
            locationManager!.startUpdatingLocation()
        }
        return true
    }
}
