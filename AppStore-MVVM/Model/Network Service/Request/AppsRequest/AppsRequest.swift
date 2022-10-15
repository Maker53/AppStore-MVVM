//
//  AppsRequest.swift
//  AppStore-MVVM
//
//  Created by Станислав on 22.09.2022.
//

enum AppsRequest: IRequest {
    
    case getTop25FreeApps
    case getTop25PaidApps
    
    var host: String {
        APIConstants.rssAppStore
    }
    
    var path: String {
        switch self {
        case .getTop25FreeApps:
            return "/api/v2/ru/apps/top-free/25/apps.json"
        case .getTop25PaidApps:
            return "/api/v2/ru/apps/top-paid/25/apps.json"
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}
