//
//  DataProvider.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 29/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Foundation
import Contentful
import Interstellar

protocol GameDataProvider {
    func fetch(completion: @escaping ([Game]) -> Void)
}

class LocalGameDataProvider: GameDataProvider {
    func fetch(completion: @escaping ([Game]) -> Void) {
        completion([
            Game(uuid: UUID(), name: "THE GAME"),
            Game(uuid: UUID(), name: "THE GAME 2"),
            Game(uuid: UUID(), name: "THE NON GAME"),
            Game(uuid: UUID(), name: "lil game"),
            Game(uuid: UUID(), name: "gamers game"),
        ])
    }
}

let client: Client = Client(spaceId: Configuration.Contentful.SPACE_ID,
                            accessToken: Configuration.Contentful.ACCESS_TOKEN)

extension Game {
    init?(_ entry: Entry) {
        guard let name = entry.fields["team1"] as? String else {
            return nil
        }
        self.init(uuid: UUID(), name: name)
    }
}

class ContentfulGameDataProvider: GameDataProvider {
    func fetch(completion: @escaping ([Game]) -> Void) {
        client.fetchEntries(matching: Query.limit(to: 100)) { (result: Result<Contentful.ArrayResponse<Entry>>) in
            switch result {
            case .success(let entries):
                completion(entries.items.compactMap(Game.init))
            case .error(let error):
                print(error)
            }
        }
    }
}
