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
        let collectionView = CollectionView<GameListCollectionViewCell, SimpleSource<GameViewModel>>(frame: .zero, layout: layout)
        collectionView.useDiffs = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    private lazy var button: UIButton = {
        let b = UIButton.createDefaultButton(title: "RELOAD")
        return b
    }()

    // MARK: - Dependencies
    private var viewModel: GameListViewModel!

    // MARK: - Public interface
    var didTapItem: Action?
    var didTapDone: Action?

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
        view.addSubview(collectionView)
        constrain(collectionView) { (c) in
            c.edges == c.superview!.edges
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(barButtonDidTap))
    }

    fileprivate func setupViewModel() {
        assert(viewModel != nil, "View Model should be instantiated. Use instantiate(viewModel:)")

        viewModel.actionCallback = { [unowned self] action in
            switch action {
            case .stateDidUpdate(let state, let prevState):
                self.collectionView.source = SimpleSource<GameViewModel>(state.items)
            }
        }
    }

    fileprivate func setupActions() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)

        collectionView.didTapItem = { [unowned self] indexPath in
            self.didTapItem?()
        }
    }

    // MARK: - Actions
    @objc private func barButtonDidTap() {
        didTapDone?()
    }

    @objc private func buttonDidTap() {
        viewModel.reloadButtonPressed()
    }
}
