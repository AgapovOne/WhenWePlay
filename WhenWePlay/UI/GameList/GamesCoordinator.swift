//
//  GamesCoordinator.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 29/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit

class GamesCoordinator: Coordinator {

    // MARK: - Properties
    private let window: UIWindow

    // MARK: - Public interface
    var didFinish: Action?

    // MARK: - Coordinator core
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showGamesList()
    }

    private func showGamesList() {
        let vc = GameListViewController.instantiate(viewModel: GameListViewModel())
        vc.didTapDone = {
            self.didFinish?()
        }
        vc.didTapItem = {
        }
        window.rootViewController = UINavigationController(rootViewController: vc)
    }
}

