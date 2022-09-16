//
//  SearchResultCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 16.09.2022.
//

class SearchResultCellViewModel: ISearchResultCellViewModel {
    
    // MARK: - Public Properties
    
    var appName: String {
        resultInfo.trackName
    }
    
    var appCategory: String {
        resultInfo.primaryGenreName
    }
    
    // MARK: - Private Properties
    
    private let resultInfo: ResultInfo
    
    // MARK: - Initializer
    
    required init(resultInfo: ResultInfo) {
        self.resultInfo = resultInfo
    }
}
