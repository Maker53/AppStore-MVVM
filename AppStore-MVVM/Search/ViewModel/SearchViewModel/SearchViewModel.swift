//
//  SearchViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 12.09.2022.
//

import UIKit

class SearchViewModel: ISearchViewModel {
    
    // MARK: - Private Properties
    
    private let requestManager: IRequestManager
    
    // MARK: - Initializer
    
    init(requestManager: IRequestManager = RequestManager()) {
        self.requestManager = requestManager
    }
    
    // MARK: - Public Methods
    
    func fetchApps() {
        let searchRequest = SearchRequest.getSearchResult(keyword: "telegram")
        let searchConfig = RequestConfig(request: searchRequest, parser: SearchResultParser())
        
        requestManager.perform(searchConfig) { result in
            switch result {
            case .success(let data):
                print(data)
                return
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
    func numberOfItemsInSection() -> Int {
        5
    }
}
