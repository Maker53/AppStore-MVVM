//
//  AppsParser.swift
//  AppStore-MVVM
//
//  Created by Станислав on 22.09.2022.
//

import Foundation

class AppsParser: IParser {
    
    typealias Model = AppGroup
    
    private let jsconDecoder: JSONDecoder
    
    init(jsconDecoder: JSONDecoder = JSONDecoder()) {
        self.jsconDecoder = jsconDecoder
        self.jsconDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func parse(data: Data) -> Model? {
        try? jsconDecoder.decode(Model.self, from: data)
    }
}
