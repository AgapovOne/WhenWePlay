//
//  GameViewModel.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 29/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Foundation

struct GameViewModel: CellViewModel {
    var id: UUID
    var title: String

    init(_ game: Game) {
        id = game.uuid
        title = game.name
    }
}

extension GameViewModel: Hashable, AutoEquatable {
    var hashValue: Int {
        return id.hashValue
    }
}
