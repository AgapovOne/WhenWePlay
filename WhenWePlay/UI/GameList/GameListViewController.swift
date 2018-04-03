//
//  GameListViewController.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 23/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit
import Cartography

final class GameListViewController: UIViewController {

    // MARK: - UI
    private lazy var collectionView: CollectionView<GameListCollectionViewCell, SimpleSource<GameViewModel>> = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.bounds.width - 32,
                                 height: 80)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8,
                                           left: 0,
                                           bottom: 8,
                                           right: 0)
        let collectionView = CollectionView<GameListCollectionViewCell, SimpleSource<GameViewModel>>(frame: .zero, layout: layout)
        collectionView.useDiffs = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    private lazy var button: UIButton = {
        let b = UIButton.createAlternateButton(title: "Refresh Data")
        return b
    }()

    // MARK: - Dependencies
    private var viewModel: GameListViewModel!

    // MARK: - Public interface
    var didTapItem: ((GameViewModel) -> Void)?

    // MARK: - Initialization
    static func instantiate(viewModel: GameListViewModel) -> GameListViewController {
        let vc = GameListViewController()
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
        view.backgroundColor = .white

        navigationController?.hero.isEnabled = true
        hero.isEnabled = true

        view.addSubview(collectionView)
        constrain(collectionView) { (c) in
            c.top == c.superview!.top
            c.left == c.superview!.left
            c.right == c.superview!.right
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
            btn.bottom == area.bottom - 16
        }

        constrain(collectionView, button) { (c, b) in
            c.bottom == b.top - 16
        }

    }

    fileprivate func setupViewModel() {
        assert(viewModel != nil, "View Model should be instantiated. Use instantiate(viewModel:)")

        viewModel.actionCallback = { [weak self] action in
            guard let `self` = self else { return }
            switch action {
            case .stateDidUpdate(let state, let prevState):
                self.collectionView.source = SimpleSource<GameViewModel>(state.items)
            }
        }
    }

    fileprivate func setupActions() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)

        collectionView.didTapItem = { [weak self] indexPath in
            guard let `self` = self else { return }
            self.didTapItem?(self.viewModel.item(at: indexPath))
        }
    }

    // MARK: - Actions
    @objc private func buttonDidTap() {
        viewModel.reloadButtonPressed()
    }
}
