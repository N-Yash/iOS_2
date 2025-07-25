//
//  LAB06_YashNaikApp.swift
//  LAB06_YashNaik
//
//  Created by Yash Vipul Naik on 2025-07-25.
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
struct FirebaseDemoApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
