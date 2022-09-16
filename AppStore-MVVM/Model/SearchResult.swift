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
    let trackName: String
    let primaryGenreName: String
}
