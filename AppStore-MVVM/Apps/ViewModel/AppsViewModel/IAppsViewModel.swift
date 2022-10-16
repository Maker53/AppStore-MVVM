//
//  IAppsViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

protocol IAppsViewModel {
    
    func fetchPageData(completion: @escaping () -> Void)
    func numberOfItemsInSection() -> Int
    func getAppsPageHeaderViewModel() -> IAppsPageHeaderViewModel
    func getAppsGroupCellViewModel(at indexPath: IndexPath) -> IAppsGroupCellViewModel
}
