//
//  ConfigFactory.swift
//  AppStore-MVVM
//
//  Created by Станислав on 17.09.2022.
//

struct ConfigFactory {
    
    func searchConfig(keyword: String) -> RequestConfig<SearchResultParser> {
        .init(request: SearchRequest.getSearchResult(keyword: keyword), parser: SearchResultParser())
    }
    
    func imageConfig(stringURL: String) -> RequestConfig<ImageParser> {
        .init(request: ImageRequest.getImage(stringUrl: stringURL), parser: ImageParser())
    }
    
    func top25FreeAppsConfig() -> RequestConfig<AppsParser> {
        .init(request: AppsRequest.getTop25FreeApps, parser: AppsParser())
    }
    
    func top25PaidAppsConfig() -> RequestConfig<AppsParser> {
        .init(request: AppsRequest.getTop25PaidApps, parser: AppsParser())
    }
    
    func appsPageHeaderConfig() -> RequestConfig<AppsPageHeaderParser> {
        .init(request: AppsPageHeaderRequest.getAppsPageHeader, parser: AppsPageHeaderParser())
    }
}
