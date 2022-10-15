//
//  SearchRequest.swift
//  AppStore-MVVM
//
//  Created by Станислав on 15.09.2022.
//

enum SearchRequest: IRequest {
    
    case getSearchResult(keyword: String)
    
    var host: String {
        APIConstants.iTunesHost
    }
    
    var path: String {
        "/search"
    }
    
    var urlParams: [String : String?] {
        var params = APIConstants.requiredQueryItems
        
        switch self {
        case .getSearchResult(let keyword):
            params["term"] = keyword
        }
        
        return params
    }
    
    var requestType: RequestType {
        .GET
    }
}
