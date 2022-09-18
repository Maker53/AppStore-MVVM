//
//  SearchResult.swift
//  AppStore-MVVM
//
//  Created by Станислав on 15.09.2022.
//

import Foundation

struct SearchResult: Decodable {
    
    let resultCount: Int
    let results: [ResultInfo]
}

struct ResultInfo: Decodable {
    
    let appName: String
    let appCategory: String
    let appImage: String
    let screenshotUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        
        case appName = "trackName"
        case appCategory = "primaryGenreName"
        case appImage = "artworkUrl100"
        case screenshotUrls
    }
}
