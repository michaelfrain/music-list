//
//  DetailView.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var itemDetail: ItemDetail
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Image(uiImage: imageForCell(fromItem: itemDetail))
                    .resizable(capInsets: EdgeInsets(top: 10.0, leading: 0.0, bottom: 10.0, trailing: 0.0), resizingMode: .stretch)
                    .padding(10.0)
                    .frame(width: 200.0, height: 200.0)
                
                Spacer()
                
                Text(itemDetail.listItem.albumName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text(itemDetail.listItem.artistName)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text(itemDetail.genre)
                Text("Released \(itemDetail.convertToReadableDate(fromString: itemDetail.releaseDate))")
                
                Spacer()
                
                Text(itemDetail.copyrightInfo)
            }
            Spacer()
            ZStack {
                Color.blue
                Link("See more on iTunes", destination: itemDetail.returnUnwrappedUrl())
                    .foregroundColor(.white)
            }
            .padding([.leading, .bottom, .trailing], 20.0)
            .frame(height: 88.0)
        }
    }
    
    func imageForCell(fromItem item: ItemDetail?) -> UIImage {
        if let image = item?.listItem.artwork { return image }
        return UIImage(systemName: "music.note") ?? UIImage()
    }
}
