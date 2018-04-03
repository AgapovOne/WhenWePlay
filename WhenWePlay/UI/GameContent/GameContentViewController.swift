//
//  GameContentViewController.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 30/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit
import Cartography
import Hero

final class GameContentViewController: UIViewController {

    // MARK: - UI
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.spacing = 16
        sv.axis = .vertical
        return sv
    }()
    private lazy var button: UIButton = {
        let b = UIButton.createAlternateButton(title: "Return")
        return b
    }()

    // MARK: - Dependencies
    private var viewModel: GameContentViewModel!

    // MARK: - Public interface
    var didTapReturnButton: ActionClosure?

    // MARK: - Initialization
    static func instantiate(viewModel: GameContentViewModel) -> GameContentViewController {
        let vc = GameContentViewController()
        vc.viewModel = viewModel
        return vc
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewModel()

        setupUI()

        setupActions()
    }

    fileprivate func setupUI() {
        hero.isEnabled = true

        view.backgroundColor = .white

        view.addSubview(stackView)
        constrain(stackView) { (sv) in
            sv.edges == sv.superview!.edges.inseted(by: 16)
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

    fileprivate func setupViewModel() {
        assert(viewModel != nil, "View Model should be instantiated. Use instantiate(viewModel:)")

        viewModel.actionCallback = { [weak self] action in
            guard let `self` = self else { return }
            switch action {
            case .stateDidUpdate(let state, let prevState):
                self.stackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })

                let label = UILabel.createDefaultLabel()
                label.hero.id = "gameNameLabel"
                label.hero.modifiers = [.fade]
                label.text = state.item.title
                self.stackView.addArrangedSubview(label)
            }
        }
    }

    fileprivate func setupActions() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc private func buttonDidTap() {
        didTapReturnButton?()
    }
}
