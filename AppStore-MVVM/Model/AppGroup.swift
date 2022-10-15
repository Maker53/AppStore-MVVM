//
//  AppGroup.swift
//  AppStore-MVVM
//
//  Created by Станислав on 22.09.2022.
//

struct AppGroup: Codable {
    
    let feed: Feed
}

struct Feed: Codable {
    
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Codable {
    
    let artistName, name: String
    let artworkUrl100: String
}
