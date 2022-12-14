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
    private let configFactory = ConfigFactory()
    private var searchResult = [ResultInfo]()
    
    // MARK: - Initializer
    
    init(requestManager: IRequestManager = RequestManager()) {
        self.requestManager = requestManager
    }
    
    // MARK: - Public Methods
    
    func fetchApps(searchKeyword keyword: String, completion: @escaping() -> Void) {
        let searchConfig = configFactory.searchConfig(keyword: keyword)
        
        requestManager.perform(searchConfig) { result in
            switch result {
            case .success(let data):
                self.searchResult = data.results
                completion()
                return
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
    func numberOfItemsInSection() -> Int {
        searchResult.count
    }
    
    func getSearchResultCellViewModel(at indexPath: IndexPath) -> ISearchResultCellViewModel {
        SearchResultCellViewModel(resultInfo: searchResult[indexPath.row])
    }
}
