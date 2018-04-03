//
//  GamesCoordinator.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 29/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit
import Hero

class GamesCoordinator: Coordinator {

    // MARK: - Properties
    private let navigationController: UINavigationController

    // MARK: - Coordinator core
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showGamesList()
    }

    private func showGamesList() {
        let vc = GameListViewController.instantiate(viewModel: GameListViewModel())
        vc.didTapItem = { vm in
            self.showGameContent(viewModel: vm)
        }
        navigationController.setViewControllers([vc], animated: false)
    }

    private func showGameContent(viewModel: GameViewModel) {
        let vm = GameContentViewModel(viewModel)
        let vc = GameContentViewController.instantiate(viewModel: vm)
        vc.didTapReturnButton = {
            vc.hero.dismissViewController()
        }
        vc.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .uncover(direction: .up))
        navigationController.present(vc, animated: true)
    }
}

