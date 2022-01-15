//
//  Album.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

import Foundation

struct Album: Codable {
    var name: String
    var artistName: String
    var artworkUrl: String
    var genres: [Genre]
    var releaseDate: String
    var iTunesUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name, artistName, genres, releaseDate
        case artworkUrl = "artworkUrl100"
        case iTunesUrl = "url"
    }
}

struct Genre: Codable {
    var name: String
}
