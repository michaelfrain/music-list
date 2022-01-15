//
//  ContentView.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    @State private var listItems = [ListItem]()
    @State private var itemDetails = [ItemDetail]()
    @State private var copyright = ""
    @State private var presentingDetail: Bool = false
    @State private var detailToPresent: ItemDetail = ItemDetail()
    
    var body: some View {
        let indexedItems = listItems.enumerated().map({ $0 })
        
        List(indexedItems, id: \.element.albumName) { index, item in
            ItemView(listItem: item)
                .onTapGesture {
                    detailToPresent = itemDetails[index]
                    presentingDetail.toggle()
                }
                .sheet(isPresented: $presentingDetail) {
                    DetailView(itemDetail: $detailToPresent)
                }
        }
        .task {
            guard let feed = await APIManager().fetchFeed("https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json")?.feed else { return }
            
            let albums = feed.results
            
            self.copyright = feed.copyright
            
            for album in albums {
                var listItem = ListItem(album: album)
                await listItem.getImageFromUrl(album.artworkUrl)
                listItems.append(listItem)
                
                let itemDetail = ItemDetail(from: album, withListItem: listItem, withMainFeed: feed)
                itemDetails.append(itemDetail)
            }
        }
    }
    
    func imageForCell(fromItem item: ListItem) -> UIImage {
        if let image = item.artwork { return image }
        return UIImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
