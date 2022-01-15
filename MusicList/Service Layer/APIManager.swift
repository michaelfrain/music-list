//
//  APIManager.swift
//  MusicList
//
//  Created by Michael Frain on 1/14/22.
//

import Foundation
import SwiftUI

class APIManager {
    static let shared = APIManager()
    
    func fetchFeed(_ urlString: String) async -> Response? {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            let feed = try JSONDecoder().decode(Response.self, from: data)
            
            return feed
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func fetchArtwork(_ urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            let image = UIImage(data: data)
            
            return image
        } catch {
            print(error)
        }
        
        return nil
    }
}
