//
//  ImageParser.swift
//  AppStore-MVVM
//
//  Created by Станислав on 17.09.2022.
//

import UIKit

class ImageParser: IParser {
    
    typealias Model = UIImage
        
    func parse(data: Data) -> Model? {
        UIImage(data: data)
    }
}
