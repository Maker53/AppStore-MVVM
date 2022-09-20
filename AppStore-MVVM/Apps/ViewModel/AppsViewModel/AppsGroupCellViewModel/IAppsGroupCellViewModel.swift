//
//  IAppsGroupCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

protocol IAppsGroupCellViewModel {
    
    func numberOfItemsInSection() -> Int
    func getAppRowCellViewModel(at indexPath: IndexPath) -> IAppRowCellViewModel
}
