//
//  Game.swift
//  WhenWePlay
//
//  Created by Aleksey Agapov on 27/03/2018.
//  Copyright © 2018 Alex Agapov. All rights reserved.
//

import Contentful

extension DateFormatter {
    static let ContentfulFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm"
        return df
    }()
}

struct Game {
    var uuid: UUID
    var team1: String
    var team2: String
    var teamScore1: Int
    var teamScore2: Int
    var datetime: Date
    var location: String
}

extension Game {
    init?(_ entry: Entry) {
        guard
            let team1 = entry.fields["team1"] as? String,
            let team2 = entry.fields["team2"] as? String,
            let teamScore1 = entry.fields["teamScore1"] as? Int,
            let teamScore2 = entry.fields["teamScore2"] as? Int,
            let datetime = DateFormatter.ContentfulFormatter.date(from: (entry.fields["datetime"] as? String) ?? ""),
            let location = entry.fields["location"] as? String
        else {
            return nil
        }
        self.init(uuid: UUID(),
                  team1: team1,
                  team2: team2,
                  teamScore1: teamScore1,
                  teamScore2: teamScore2,
                  datetime: datetime,
                  location: location)
    }
}
