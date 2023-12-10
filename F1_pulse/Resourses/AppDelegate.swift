//
//  AppDelegate.swift
//  F1_pulse
//
//  Created by Egor Diachkov on 17/11/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
        UITabBar.appearance().isTranslucent = false
        return true
    }

}

