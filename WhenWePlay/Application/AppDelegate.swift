//
//  AppDelegate.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 22/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit
import UIFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window?.rootViewController = GameListViewController.instantiate()

        return true
    }
}
