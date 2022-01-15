//
//  Feed.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

struct Feed: Codable {
    var copyright: String
    var results: [Album]

    enum CodingKeys: String, CodingKey {
        case copyright, results
    }
}
