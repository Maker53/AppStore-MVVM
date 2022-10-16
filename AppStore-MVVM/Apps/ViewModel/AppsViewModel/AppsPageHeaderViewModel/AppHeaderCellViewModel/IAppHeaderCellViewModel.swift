//
//  IAppHeaderCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import UIKit

protocol IAppHeaderCellViewModel {
    
    var appName: String { get }
    var title: String { get }
    
    init(appPageHeader: AppPageHeader)
    
    func getAppPageHeaderImage(completion: @escaping (UIImage?) -> Void)
}
