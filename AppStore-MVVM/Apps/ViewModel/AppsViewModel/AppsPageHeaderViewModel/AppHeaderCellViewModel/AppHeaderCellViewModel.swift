//
//  AppHeaderCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import UIKit

class AppHeaderCellViewModel: IAppHeaderCellViewModel {
    
    // MARK: - Public Properties
    
    var appName: String {
        appPageHeader.name
    }
    
    var title: String {
        appPageHeader.tagline
    }
    
    // MARK: - Private Properties
    
    private let appPageHeader: AppPageHeader
    private let configFactory = ConfigFactory()
    private lazy var requestManager: IRequestManager = RequestManager()
    private lazy var cacheService: IImageCacheService = ImageCacheService.shared
    
    // MARK: - Initializer
    
    required init(appPageHeader: AppPageHeader) {
        self.appPageHeader = appPageHeader
    }
    
    // MARK: - Public Methods
    
    func getAppPageHeaderImage(completion: @escaping (UIImage?) -> Void) {
        let url = appPageHeader.imageUrl
        let config = configFactory.imageConfig(stringURL: url)
        
        if let image = cacheService.getImage(forKey: url) {
            completion(image)
        } else {
            requestManager.perform(config) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let image):
                    completion(image)
                    self.cacheService.insertImage(image, forKey: url)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
