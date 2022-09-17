//
//  SearchResultCellViewModel.swift
//  AppStore-MVVM
//
//  Created by Станислав on 16.09.2022.
//

import UIKit

class SearchResultCellViewModel: ISearchResultCellViewModel {
    
    // MARK: - Public Properties
    
    var appName: String {
        resultInfo.appName
    }
    
    var appCategory: String {
        resultInfo.appCategory
    }
    
    // MARK: - Private Properties
    
    private let resultInfo: ResultInfo
    private let configFactory = ConfigFactory()
    private lazy var requestManager: IRequestManager = RequestManager()
    private lazy var cacheService: IImageCacheService = ImageCacheService.shared
    
    // MARK: - Initializer
    
    required init(resultInfo: ResultInfo) {
        self.resultInfo = resultInfo
    }
    
    // MARK: - Public Methods
    
    func getAppImage(completion: @escaping (UIImage?) -> Void) {
        fetchImage(fromStringUrl: resultInfo.appImage) { image in
            completion(image)
        }
    }
    
    func getScreenshots(completion: @escaping (UIImage?, Int) -> Void) {
        var counter = 0
        
        for screenshootUrl in resultInfo.screenshotUrls where counter < 3 {
            fetchImage(fromStringUrl: screenshootUrl) { [counter] image in
                completion(image, counter)
            }
            
            counter += 1
        }
    }
}

// MARK: - Private Methods

extension SearchResultCellViewModel {
    private func fetchImage(fromStringUrl url: String, completion: @escaping (UIImage?) -> Void) {
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
