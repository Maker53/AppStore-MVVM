//
//  AppsGroupCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

class AppsGroupCellViewModel: IAppsGroupCellViewModel {
    
    // MARK: - Public Methods
    
    func numberOfItemsInSection() -> Int {
        10
    }
    
    func getAppRowCellViewModel(at indexPath: IndexPath) -> IAppRowCellViewModel {
        AppRowCellViewModel()
    }
}
