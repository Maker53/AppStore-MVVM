//
//  IAppsViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

protocol IAppsViewModel {
    
    func numberOfItemsInSection() -> Int
    func getAppsPageHeaderViewModel(at indexPath: IndexPath) -> IAppsPageHeaderViewModel
    func getAppsGroupCellViewModel(at indexPath: IndexPath) -> IAppsGroupCellViewModel
}
