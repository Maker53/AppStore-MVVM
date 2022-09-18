//
//  ISearchResultCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 16.09.2022.
//

import UIKit

protocol ISearchResultCellViewModel {
    
    var appName: String { get }
    var appCategory: String { get }
    
    init(resultInfo: ResultInfo)
    
    func getAppImage(completion: @escaping (UIImage?) -> Void)
    func getScreenshots(completion: @escaping (UIImage?, Int) -> Void)
}
