//
//  SplashViewController.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 29/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit
import Cartography

final class SplashViewController: UIViewController {

    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Background")
        return iv
    }()
    private lazy var button: UIButton = {
        let b = UIButton.createDefaultButton(title: "Start")
        return b
    }()

    // MARK: - Dependencies
//    private var viewModel: GameListViewModel!

    // MARK: - Public interface
    private var didTapStart: Action? = nil

    // MARK: - Initialization
    static func instantiate() -> SplashViewController {
        let vc = SplashViewController()
//        vc.viewModel = viewModel
        return vc
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

//        setupViewModel()

        setupUI()

        setupActions()
    }

    fileprivate func setupUI() {
        view.addSubview(backgroundImageView)
        constrain(backgroundImageView) { (b) in
            b.edges == b.superview!.edges
        }

        view.addSubview(button)
        constrain(button) { (btn) in
            let area: SupportsEdgesLayoutProxy
            if #available(iOS 11.0, *) {
                area = btn.superview!.safeAreaLayoutGuide
            } else {
                area = btn.superview!
            }
            btn.left == area.left
            btn.right == area.right
            btn.bottom == area.bottom - 8
        }
    }

//    fileprivate func setupViewModel() {
//        assert(viewModel != nil, "View Model should be instantiated. Use instantiate(viewModel:)")
//    }

    fileprivate func setupActions() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc private func buttonDidTap() {
        didTapStart?()
//        viewModel.reloadButtonPressed()
    }
}

