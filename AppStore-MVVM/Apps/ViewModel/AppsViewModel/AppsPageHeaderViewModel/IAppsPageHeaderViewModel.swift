//
//  IAppsPageHeaderViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

protocol IAppsPageHeaderViewModel {
    
    var appsPageHeader: Box<[AppPageHeader]> { get }
    
    init(appsPageHeader: [AppPageHeader])
    
    func numberOfItemsInSection() -> Int
    func getAppHeaderCellViewModel(at indexPath: IndexPath) -> IAppHeaderCellViewModel
}
