//
//  ISearchViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 12.09.2022.
//

import Foundation

protocol ISearchViewModel {
    
    func fetchApps(completion: @escaping() -> Void)
    func numberOfItemsInSection() -> Int
    func getSearchResultCellViewModel(at indexPath: IndexPath) -> ISearchResultCellViewModel
}
