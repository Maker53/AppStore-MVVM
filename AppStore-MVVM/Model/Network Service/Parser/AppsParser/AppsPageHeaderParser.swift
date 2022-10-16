//
//  AppsPageHeaderParser.swift
//  AppStore-MVVM
//
//  Created by Станислав on 16.10.2022.
//

import Foundation

class AppsPageHeaderParser: IParser {
    
    typealias Model = [AppPageHeader]
    
    private let jsconDecoder: JSONDecoder
    
    init(jsconDecoder: JSONDecoder = JSONDecoder()) {
        self.jsconDecoder = jsconDecoder
        self.jsconDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func parse(data: Data) -> Model? {
        try? jsconDecoder.decode(Model.self, from: data)
    }
}
