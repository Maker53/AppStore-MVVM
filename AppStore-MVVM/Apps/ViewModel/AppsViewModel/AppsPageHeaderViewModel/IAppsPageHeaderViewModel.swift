//
//  IAppsPageHeaderViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

protocol IAppsPageHeaderViewModel {
    
    func numberOfItemsInSection() -> Int
    func getAppHeaderCellViewModel(at indexPath: IndexPath) -> IAppHeaderCellViewModel
}
