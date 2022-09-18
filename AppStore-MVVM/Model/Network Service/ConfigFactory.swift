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
}
