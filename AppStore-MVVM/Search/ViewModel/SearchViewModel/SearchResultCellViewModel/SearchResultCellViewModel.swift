//
//  SearchResultCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 16.09.2022.
//

class SearchResultCellViewModel: ISearchResultCellViewModel {
    
    // MARK: - Public Properties
    
    var appName: String {
        resultInfo.appName
    }
    
    var appCategory: String {
        resultInfo.appCategory
    }
    
    // MARK: - Private Properties
    
    private let resultInfo: ResultInfo
    
    // MARK: - Initializer
    
    required init(resultInfo: ResultInfo) {
        self.resultInfo = resultInfo
    }
}
