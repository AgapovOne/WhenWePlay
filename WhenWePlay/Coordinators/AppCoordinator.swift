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

class AppCoordinator: NSObject, Coordinator {

    // MARK: - Properties
    private let window: UIWindow
    private lazy var navigationController: UINavigationController = {
        let nc = UINavigationController()
        nc.delegate = self
        return nc
    }()
    private var childCoordinators = [AppChildCoordinator: Coordinator]()

    private var didStartAlready = false

    // MARK: - Coordinator core
    init(window: UIWindow) {
        self.window = window

        super.init()

        window.rootViewController = navigationController
    }

    func start() {
        showGamesList()
    }

    private func showGamesList() {
        let gamesCoordinator = GamesCoordinator(navigationController: navigationController)
        childCoordinators[.games] = gamesCoordinator
        gamesCoordinator.start()
    }
}

extension AppCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if !didStartAlready {
            let vc = SplashViewController.instantiate()
            vc.didTapStart = {
                self.navigationController.dismiss(animated: true)
            }
            navigationController.present(vc, animated: false)
            didStartAlready = true
        }
    }
}
