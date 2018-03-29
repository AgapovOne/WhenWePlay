//
//  AppDelegate.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 22/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start()

        window?.makeKeyAndVisible()

        return true
    }
}
