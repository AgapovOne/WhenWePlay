//
//  GameListViewModel.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 23/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Foundation

typealias Item = String

public final class GameListViewModel {
    struct State {
        var items: [GameViewModel]
    }

    enum Action {
        case
        stateDidUpdate(newState: State, prevState: State?)
    }

    typealias ActionClosure = (Action) -> Void

    private let provider: GameDataProvider

    var state = State(items: []) {
        didSet {
            actionCallback?(.stateDidUpdate(newState: state, prevState: oldValue))
        }
    }

    public init(provider: GameDataProvider = LocalGameDataProvider()) {
        self.provider = provider
    }

    var actionCallback: ActionClosure? {
        didSet {
            actionCallback?(.stateDidUpdate(newState: state, prevState: nil))
        }
    }

    func reloadButtonPressed() {
        state.items = provider.fetch()
        .map(GameViewModel.init)
    }
}
