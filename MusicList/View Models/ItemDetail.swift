//
//  ItemDetail.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

import Foundation

struct ItemDetail {
    var listItem: ListItem
    var genre: String
    var releaseDate: String
    var copyrightInfo: String
    var buttonLink: String
    
    init() {
        self.listItem = ListItem(album: Album(name: "", artistName: "", artworkUrl: "", genres: [], releaseDate: "", iTunesUrl: ""))
        self.genre = ""
        self.releaseDate = ""
        self.copyrightInfo = ""
        self.buttonLink = ""
    }
    
    init(from album: Album, withListItem listItem: ListItem? = nil, withMainFeed feed: Feed? = nil) {
        if let listItem = listItem {
            self.listItem = listItem
        } else {
            self.listItem = ListItem(album: album)
        }
        self.releaseDate = album.releaseDate
        self.copyrightInfo = feed?.copyright ?? ""
        self.buttonLink = album.iTunesUrl
        
        let flatGenres = album.genres.compactMap { genre in
            return genre.name
        }
        let genreString = flatGenres.joined(separator: ", ")
        self.genre = genreString
    }
    
    func returnUnwrappedUrl() -> URL {
        if let url = URL(string: buttonLink) {
            return url
        }
        
        return URL(fileURLWithPath: "")
        // This is a cheat. You said no force unwrapping. Thanks Apple for making the URL type untenable. Ideally this should never happen.
    }
    
    func convertToReadableDate(fromString string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Breakable if the API response changes date format
        guard let newDate = dateFormatter.date(from: self.releaseDate) else { return "" }
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: newDate)
    }
}
