//
//  DataProvider.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 29/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Foundation

protocol GameDataProvider {
    func fetch() -> [Game]
}

class LocalGameDataProvider: GameDataProvider {
    func fetch() -> [Game] {
        return [
            Game(uuid: UUID(), name: "THE GAME"),
            Game(uuid: UUID(), name: "THE GAME 2"),
            Game(uuid: UUID(), name: "THE NON GAME"),
            Game(uuid: UUID(), name: "lil game"),
            Game(uuid: UUID(), name: "gamers game"),
        ]
    }
}
