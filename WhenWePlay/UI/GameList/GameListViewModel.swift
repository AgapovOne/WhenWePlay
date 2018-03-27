//
//  GameListViewModel.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 23/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Foundation

typealias Item = String

class GameListViewModel {
    struct State {
        var items: [Item]
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
        state.items = Array(Set([
            "ZAZA",
            "BABA",
            "DADA",
        ]))

    }
}
