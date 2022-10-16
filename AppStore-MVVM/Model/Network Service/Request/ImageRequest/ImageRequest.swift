//
//  ImageRequest.swift
//  AppStore-MVVM
//
//  Created by Станислав on 17.09.2022.
//

enum ImageRequest: IRequest {
    
case getImage(stringUrl: String)
    
    var stringUrl: String {
        switch self {
        case .getImage(let stringUrl): return stringUrl
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}
