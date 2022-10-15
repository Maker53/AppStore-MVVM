//
//  IAppRowCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import UIKit

protocol IAppRowCellViewModel {
    
    var appName: String { get }
    var companyName: String { get }
    
    init(feedResult: FeedResult)
    
    func getAppImage(completion: @escaping (UIImage?) -> Void)
}
