//
//  ListItemTests.swift
//  MusicListTests
//
//  Created by Michael Frain on 1/14/22.
//

import XCTest
@testable import MusicList

class ListItemTests: XCTestCase {
    var testItem: ListItem?

    override func setUpWithError() throws {
        let genre = Genre(name: "Sample genre")
        let album = Album(name: "Sample Album", artistName: "Sample Artist", artworkUrl: "https://is2-ssl.mzstatic.com/image/thumb/Music126/v4/94/4d/9a/944d9a8d-0549-f537-5706-5b083bd84a7d/21UM1IM38949.rgb.jpg/100x100bb.jpg", genres: [genre], releaseDate: "2022-01-14", iTunesUrl: "https://music.apple.com/us/album/encanto-original-motion-picture-soundtrack/1594677532")
        
        self.testItem = ListItem(album: album)
    }

    override func tearDownWithError() throws {
        self.testItem = nil
    }

    func testExample() async {
        guard var testItem = self.testItem else {
            XCTFail()
            return
        }
        
        await testItem.getImageFromUrl(testItem.artworkUrl)
        XCTAssertNotNil(testItem.artwork)
    }
}
