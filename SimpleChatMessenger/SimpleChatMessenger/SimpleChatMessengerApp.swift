//
//  SimpleChatMessengerApp.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2023/07/12.
//  Copyright © 2023 F-Works. All rights reserved.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct SimpleChatMessengerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
