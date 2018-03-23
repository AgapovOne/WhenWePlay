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

class GameListViewModel {
    struct State {
        var items: [String]
    }

    enum Action {
        case
        stateDidUpdate(newState: State, prevState: State?)
    }

    typealias ActionClosure = (Action) -> Void

    var actionCallback: ActionClosure

    var state = State(items: ["KAKA"]) {
        didSet {
            actionCallback(.stateDidUpdate(newState: state, prevState: oldValue))
        }
    }

    init(_ callback: @escaping ActionClosure) {
        actionCallback = callback
        callback(.stateDidUpdate(newState: state, prevState: nil))
    }

    func reloadButtonPressed() {
        state.items = [
            "ZAZA",
            "BABA",
            "DADA",
        ]
    }
}

public class GameListViewController: UIViewController, StoryboardBased {

//    private lazy var collectionView: UICollectionView = {
//        let cv = UICollectionView()
////        cv.dataSource = self
//        return cv
//    }()
    private lazy var button = UIButton.createDefaultButton(title: "RELOAD")

    var viewModel: GameListViewModel!

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        viewModel = GameListViewModel({ [unowned self] action in
            switch action {
            case .stateDidUpdate(let state, let prevState):
//                let oldItems = prevState?.items ?? []
//                let changes = diff(old: oldItems, new: state.items)
//
//                self.collectionView.reload(changes: changes, section: 0, completion: { _ in })
                self.button.setTitle(state.items[0], for: .normal)
            }
        })

//        view.addSubview(collectionView)
//        constrain(collectionView) { (c) in
//            c.edges == c.superview!.edges
//        }

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

//extension GameListViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(for: indexPath)
//    }
//}

extension UIButton {
    static func createDefaultButton(title: String) -> UIButton {
        let btn = UIButton(frame: .zero)
        btn.setTitle(title, for: .normal)
        btn.tintColor = .green
        return btn
    }
}
