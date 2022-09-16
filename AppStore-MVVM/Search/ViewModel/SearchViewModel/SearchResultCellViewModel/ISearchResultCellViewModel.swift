//
//  ISearchResultCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 16.09.2022.
//

protocol ISearchResultCellViewModel {
    
    var appName: String { get }
    var appCategory: String { get }
    
    init(resultInfo: ResultInfo)
}
