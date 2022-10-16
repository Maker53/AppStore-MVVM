//
//  AppsPageHeaderRequest.swift
//  AppStore-MVVM
//
//  Created by Станислав on 16.10.2022.
//

enum AppsPageHeaderRequest: IRequest {
    
    case getAppsPageHeader
    
    var host: String {
        APIConstants.appPageHeaderHost
    }
    
    var path: String {
        "/appstore/social"
    }
    
    var requestType: RequestType {
        .GET
    }
}
