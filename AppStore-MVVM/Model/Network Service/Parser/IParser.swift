//
//  IParser.swift
//  AppStore-MVVM
//
//  Created by Станислав on 14.09.2022.
//

import Foundation

protocol IParser {
    
    associatedtype Model
    func parse(data: Data) -> Model?
}
