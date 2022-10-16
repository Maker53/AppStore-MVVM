//
//  AppsPageHeaderViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

class AppsPageHeaderViewModel: IAppsPageHeaderViewModel {
    
    // MARK: - Public Properties
    
    var appsPageHeader: Box<[AppPageHeader]>
    
    // MARK: - Initializer
    
    required init(appsPageHeader: [AppPageHeader]) {
        self.appsPageHeader = Box(appsPageHeader)
    }
    
    // MARK: - Public Methods
    
    func numberOfItemsInSection() -> Int {
        appsPageHeader.value.count
    }
    
    func getAppHeaderCellViewModel(at indexPath: IndexPath) -> IAppHeaderCellViewModel {
        AppHeaderCellViewModel(appPageHeader: appsPageHeader.value[indexPath.row])
    }
}
