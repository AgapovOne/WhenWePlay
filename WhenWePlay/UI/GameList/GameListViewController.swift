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

public class GameListViewController: UIViewController, StoryboardBased {

    // UI
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: self.view.frame.width - 32, height: 200)
//        let cv = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
//        cv.dataSource = self
//        return cv
//    }()
    private lazy var button = UIButton.createDefaultButton(title: "RELOAD")

    // Setup
    var viewModel: GameListViewModel!

    // Properties
    var items = [Item]()

    public override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = GameListViewModel({ [unowned self] action in
            switch action {
            case .stateDidUpdate(let state, let prevState):
                let oldItems = prevState?.items ?? []
                let changes = diff(old: oldItems, new: state.items)

                self.collectionView.reload(changes: changes, section: 0, completion: { _ in })
            }
        })

        view.addSubview(collectionView)
        constrain(collectionView) { (c) in
            c.edges == c.superview!.edges
        }

        view.addSubview(button)
        constrain(button) { (btn) in
            btn.center == btn.superview!.center
        }

        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }

    @objc private func buttonDidTap() {
        viewModel.reloadButtonPressed()
    }
}

extension GameListViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.state.items.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GameListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        var color: UIColor
        switch indexPath.row {
        case 0...1:
            color = .black
        case 2...3:
            color = .green
        default:
            color = .yellow
        }
        cell.backgroundColor = color
        cell.item = viewModel.state.items[indexPath.row]
        return cell
    }
}
