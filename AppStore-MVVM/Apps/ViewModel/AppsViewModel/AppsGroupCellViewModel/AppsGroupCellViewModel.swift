//
//  AppsGroupCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

class AppsGroupCellViewModel: IAppsGroupCellViewModel {
    
    // MARK: - Public Properties
    
    var title: String {
        appGroup.feed.title
    }
    
    // MARK: - Private Properties
    
    private let requestManager: IRequestManager = RequestManager()
    private let configFactory = ConfigFactory()
    private let appGroup: AppGroup
    
    // MARK: - Initializer
    
    required init(appGroup: AppGroup) {
        self.appGroup = appGroup
    }
    
    // MARK: - Public Methods
    
    func numberOfItemsInSection() -> Int {
        appGroup.feed.results.count
    }
    
    func getAppRowCellViewModel(at indexPath: IndexPath) -> IAppRowCellViewModel {
        AppRowCellViewModel(feedResult: appGroup.feed.results[indexPath.row])
    }
}
