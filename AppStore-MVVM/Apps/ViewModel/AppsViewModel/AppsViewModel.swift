//
//  AppsViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import Foundation

class AppsViewModel: IAppsViewModel {
    
    // MARK: - Private Properties
    
    private var appGroups = [AppGroup]()
    private let requestManager: IRequestManager
    private let configFactory = ConfigFactory()
    
    // MARK: - Initializer
    
    init(requestManager: IRequestManager = RequestManager()) {
        self.requestManager = requestManager
    }
    
    // MARK: - Public Methods
    
    func fetchPageData(completion: @escaping () -> Void) {
        if !appGroups.isEmpty {
            appGroups = []
        }
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        fetchAppGroup(config: configFactory.top25FreeAppsConfig()) { appGroup in
            self.appGroups.insert(appGroup, at: 0)
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchAppGroup(config: configFactory.top25PaidAppsConfig()) { appGroup in
            self.appGroups.append(appGroup)
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) { completion() }
    }
    
    func numberOfItemsInSection() -> Int {
        appGroups.count
    }
    
    func getAppsPageHeaderViewModel(at indexPath: IndexPath) -> IAppsPageHeaderViewModel {
        AppsPageHeaderViewModel()
    }
    
    func getAppsGroupCellViewModel(at indexPath: IndexPath) -> IAppsGroupCellViewModel {
        AppsGroupCellViewModel(appGroup: appGroups[indexPath.row])
    }
}

// MARK: - Private Methods

extension AppsViewModel {
    
    private func fetchAppGroup(config: RequestConfig<AppsParser>, completion: @escaping(AppGroup) -> Void) {
        requestManager.perform(config) { result in
            switch result {
            case .success(let data):
                completion(data)
                return
            case .failure(let error):
                print(error)
                return
            }
        }
    }
}
