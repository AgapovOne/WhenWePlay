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

    // MARK: - Public interface
    var didTapStart: Action? = nil

    // MARK: - Initialization
    static func instantiate() -> SplashViewController {
        let vc = SplashViewController()
        return vc
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

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
            btn.left == area.left + 16
            btn.right == area.right - 16
            btn.bottom == area.bottom - 8
        }
    }

    fileprivate func setupActions() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc private func buttonDidTap() {
        didTapStart?()
    }
}
