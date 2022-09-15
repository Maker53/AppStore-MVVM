//
//  SearchResultParser.swift
//  AppStore-MVVM
//
//  Created by Станислав on 15.09.2022.
//

import Foundation

class SearchResultParser: IParser {
    
    typealias Model = SearchResult
    
    private let jsconDecoder: JSONDecoder
    
    init(jsconDecoder: JSONDecoder = JSONDecoder()) {
        self.jsconDecoder = jsconDecoder
        self.jsconDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func parse(data: Data) -> Model? {
        try? jsconDecoder.decode(Model.self, from: data)
    }
}
