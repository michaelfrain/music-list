//
//  ItemView.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

import SwiftUI

struct ItemView: View {
    var listItem: ListItem?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(uiImage: imageForCell(fromItem: listItem))
                Text(listItem?.albumName ?? "")
                    .font(.headline)
                    .minimumScaleFactor(/*@START_MENU_TOKEN@*/0.3/*@END_MENU_TOKEN@*/)
            }
            Text(listItem?.artistName ?? "")
                .font(.caption)
        }
    }
    
    func imageForCell(fromItem item: ListItem?) -> UIImage {
        if let image = item?.artwork { return image }
        return UIImage(systemName: "music.note") ?? UIImage()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(listItem: ListItem(album: Album(name: "Album Name", artistName: "Artist Name", artworkUrl: "https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/73/6d/7c/736d7cfb-c79d-c9a9-4170-5e71d008dea1/886449666430.jpg/100x100bb.jpg", genres: [], releaseDate: "Jan 1, 2020", iTunesUrl: "http://apple.com")))
    }
}

