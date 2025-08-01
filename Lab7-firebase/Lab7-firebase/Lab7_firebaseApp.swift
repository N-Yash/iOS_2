//
//  Lab7_FirebaseApp.swift
//  Lab7-Firebase
//
//  Created by Yash Vipul Naik on 2025-08-01.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
 func application(_ application: UIApplication,
          didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
  FirebaseApp.configure()
  return true
 }
}

@main
struct iOSLab07_FirebaseApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var locationHelper = LocationHelper()
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(locationHelper)
    }
  }
}
