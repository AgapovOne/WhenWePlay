//
//  GameListViewController.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 23/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import UIKit
import DeepDiff
import Cartography
import Reusable

public final class GameListViewController: UIViewController, StoryboardBased {

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
    var viewModel: GameListViewModel!

    // MARK: - Initialization
    public static func instantiate(viewModel: GameListViewModel) -> GameListViewController {
        let vc = GameListViewController.instantiate()
        vc.viewModel = viewModel
        return vc
    }

    // MARK: - Lifecycle
    public override func viewDidLoad() {
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
            print("TAPP!!!@")
        }
    }

    // MARK: - Actions
    @objc private func buttonDidTap() {
        viewModel.reloadButtonPressed()
    }
}
