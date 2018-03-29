//
//  AppCoordinator.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 29/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit

enum AppChildCoordinator {
    case games
}

class AppCoordinator: Coordinator {

    // MARK: - Properties
    private let window: UIWindow
    private var childCoordinators = [AppChildCoordinator: Coordinator]()

    // MARK: - Coordinator core
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showSplash()
    }

    private func showSplash() {
        let vc = SplashViewController.instantiate()
        vc.didTapStart = {
            self.showGamesList()
        }
        self.window.rootViewController = vc
    }

    private func showGamesList() {
        let gamesCoordinator = GamesCoordinator(window: window)
        gamesCoordinator.didFinish = { [unowned self] in
            self.showSplash()
        }

        childCoordinators[.games] = gamesCoordinator
        gamesCoordinator.start()
    }
}

