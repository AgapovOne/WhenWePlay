//
//  GameContentViewModel.swift
//  WhenWePlay
//
//  Created by Alex Agapov on 30/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Foundation

final class GameContentViewModel {
    struct State {
        var item: GameViewModel
    }

    enum Action {
        case
        stateDidUpdate(newState: State, prevState: State?)
    }

    typealias ActionClosure = (Action) -> Void

    var state: State {
        didSet {
            actionCallback?(.stateDidUpdate(newState: state, prevState: oldValue))
        }
    }

    init(_ gameViewModel: GameViewModel) {
        state = State(item: gameViewModel)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            self.state.item.title = "GAME HAS CHANGED"
        }
    }

    var actionCallback: ActionClosure? {
        didSet {
            actionCallback?(.stateDidUpdate(newState: state, prevState: nil))
        }
    }

}
