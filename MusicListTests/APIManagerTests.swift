//
//  APIManagerTests.swift
//  MusicListTests
//
//  Created by Michael Frain on 1/14/22.
//

import XCTest
@testable import MusicList

class APIManagerTests: XCTestCase {
    func testFetchAlbums() async {
        let response = await APIManager.shared.fetchFeed("https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json")
        
        XCTAssertNotNil(response)
    }
    
    func testFetchArtwork() async {
        let artwork = await APIManager.shared.fetchArtwork("https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/03/d0/bb/03d0bbde-4315-8bbb-8880-866fc6fdef6d/810043689243.jpg/100x100bb.jpg")
        
        XCTAssertNotNil(artwork)
    }
}
