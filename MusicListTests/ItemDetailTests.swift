//
//  ItemDetailTests.swift
//  MusicListTests
//
//  Created by Michael Frain on 1/14/22.
//

import XCTest
@testable import MusicList

class ItemDetailTests: XCTestCase {
    var testAlbum: Album?
    var testGenre: Genre?

    override func setUpWithError() throws {
        let testGenre = Genre(name: "Sample genre")
        self.testGenre = testGenre
        self.testAlbum = Album(name: "Sample Album", artistName: "Sample Artist", artworkUrl: "https://is2-ssl.mzstatic.com/image/thumb/Music126/v4/94/4d/9a/944d9a8d-0549-f537-5706-5b083bd84a7d/21UM1IM38949.rgb.jpg/100x100bb.jpg", genres: [testGenre], releaseDate: "2022-01-14", iTunesUrl: "https://music.apple.com/us/album/encanto-original-motion-picture-soundtrack/1594677532")
    }

    override func tearDownWithError() throws {
        self.testAlbum = nil
        self.testGenre = nil
    }

    func testConstructionWithListItem() async {
        guard let testAlbum = testAlbum else {
            XCTFail()
            return
        }

        var listItem = ListItem(album: testAlbum)
        await listItem.getImageFromUrl(listItem.artworkUrl)
        let detail = ItemDetail(from: testAlbum, withListItem: listItem)
        
        XCTAssertNotNil(detail.listItem)
        XCTAssertNotNil(detail.listItem.artwork)
    }
    
    func testConstructionWithNoListItem() async {
        guard let testAlbum = testAlbum else {
            XCTFail()
            return
        }

        var detail = ItemDetail(from: testAlbum)
        
        XCTAssertNotNil(detail.listItem)
        XCTAssertNil(detail.listItem.artwork)
        
        await detail.listItem.getImageFromUrl(detail.listItem.artworkUrl)
        
        XCTAssertNotNil(detail.listItem.artwork)
    }
    
    func testReadableDateConversion() {
        guard let testAlbum = testAlbum else {
            XCTFail()
            return
        }

        let detail = ItemDetail(from: testAlbum)
        let dateString = detail.convertToReadableDate(fromString: detail.releaseDate)
        
        XCTAssertEqual(dateString, "Jan 14, 2022")
    }
}
