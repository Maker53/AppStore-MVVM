//
//  AppsViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

class AppsViewModel: IAppsViewModel {
    
    // MARK: - Private Properties
    
    private let apps = [1,2,3]
    
    // MARK: - Public Methods
    
    func numberOfItemsInSection() -> Int {
        apps.count
    }
    
    func getAppsPageHeaderViewModel(at indexPath: IndexPath) -> IAppsPageHeaderViewModel {
        AppsPageHeaderViewModel()
    }
    
    func getAppsGroupCellViewModel(at indexPath: IndexPath) -> IAppsGroupCellViewModel {
        AppsGroupCellViewModel()
    }
}
