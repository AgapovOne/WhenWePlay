//
//  Game.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 27/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Foundation

struct Game {
    var uuid: UUID
    var name: String

    init(uuid: UUID, name: String) {
        self.uuid = uuid
        self.name = name
    }
}
