//
//  Response.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

struct Response: Codable {
    var feed: Feed
    
    enum CodingKeys: String, CodingKey {
        case feed
    }
}
