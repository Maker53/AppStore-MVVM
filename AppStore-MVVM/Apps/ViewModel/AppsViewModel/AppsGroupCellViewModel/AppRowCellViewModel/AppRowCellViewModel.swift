//
//  AppRowCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 20.09.2022.
//

import UIKit

class AppRowCellViewModel: IAppRowCellViewModel {
    
    // MARK: - Public Properties
    
    var appName: String {
        feedResult.name
    }
    
    var companyName: String {
        feedResult.artistName
    }
    
    // MARK: - Private Properties
    
    private let feedResult: FeedResult
    private let configFactory = ConfigFactory()
    private lazy var requestManager: IRequestManager = RequestManager()
    private lazy var cacheService: IImageCacheService = ImageCacheService.shared
    
    // MARK: - Initiaizer
    
    required init(feedResult: FeedResult) {
        self.feedResult = feedResult
    }
    
    // MARK: - Public Methods
    
    func getAppImage(completion: @escaping (UIImage?) -> Void) {
        let url = feedResult.artworkUrl100
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
