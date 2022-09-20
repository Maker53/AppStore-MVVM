//
//  AppsPageHeaderViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

class AppsPageHeaderViewModel: IAppsPageHeaderViewModel {
    
    // MARK: - Private Properties
    
    // MARK: - Public Methods
    
    func numberOfItemsInSection() -> Int {
        3
    }
    
    func getAppHeaderCellViewModel(at indexPath: IndexPath) -> IAppHeaderCellViewModel {
        AppHeaderCellViewModel()
    }
}
