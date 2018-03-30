//
//  GameListViewModel.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 23/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Foundation

final class GameListViewModel {
    struct State {
        var items: [GameViewModel]
    }

    enum Action {
        case
        stateDidUpdate(newState: State, prevState: State?)
    }

    typealias ActionClosure = (Action) -> Void

    private let provider: GameDataProvider

    private var state = State(items: []) {
        didSet {
            actionCallback?(.stateDidUpdate(newState: state, prevState: oldValue))
        }
    }

    init(provider: GameDataProvider = ContentfulGameDataProvider()) {
        self.provider = provider
    }

    var actionCallback: ActionClosure? {
        didSet {
            actionCallback?(.stateDidUpdate(newState: state, prevState: nil))
        }
    }

    // Inputs
    func reloadButtonPressed() {
        provider.fetch { (games) in
            DispatchQueue.main.async {
                self.state.items = games.map(GameViewModel.init)
            }
        }
    }

    // Outputs
    func item(at indexPath: IndexPath) -> GameViewModel {
        return state.items[indexPath.row]
    }

}
