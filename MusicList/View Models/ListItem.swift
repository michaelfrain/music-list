//
//  ListItem.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

import UIKit

struct ListItem {    
    var albumName: String
    var artistName: String
    var artworkUrl: String
    var artwork: UIImage?
    
    init(album: Album) {
        self.albumName = album.name
        self.artistName = album.artistName
        self.artworkUrl = album.artworkUrl
    }
    
    mutating func getImageFromUrl(_ urlString: String) async {
        guard let image = await APIManager().fetchArtwork(urlString) else { return }
        self.artwork = image
    }
}
