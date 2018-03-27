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

    var state = State(items: []) {
        didSet {
            actionCallback?(.stateDidUpdate(newState: state, prevState: oldValue))
        }
    }

    public init(games: [Game]) {
        state = State(items: games.map(GameViewModel.init))
    }

    var actionCallback: ActionClosure? {
        didSet {
            actionCallback?(.stateDidUpdate(newState: state, prevState: nil))
        }
    }

    func reloadButtonPressed() {
        state.items = [
            Game(uuid: UUID(), name: "THE GAME"),
            Game(uuid: UUID(), name: "THE GAME 2"),
            Game(uuid: UUID(), name: "THE NON GAME"),
            Game(uuid: UUID(), name: "lil game"),
            Game(uuid: UUID(), name: "gamers game"),
        ]
        .map(GameViewModel.init)

    }
}
