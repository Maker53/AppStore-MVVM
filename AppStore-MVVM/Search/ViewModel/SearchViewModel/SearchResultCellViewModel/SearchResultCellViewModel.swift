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
    private lazy var requestManager: IRequestManager = RequestManager()
    private lazy var cacheService: IImageCacheService = ImageCacheService.shared
    
    // MARK: - Initializer
    
    required init(resultInfo: ResultInfo) {
        self.resultInfo = resultInfo
    }
    
    // MARK: - Public Methods
    
    func getAppImage(completion: @escaping (UIImage?) -> Void) {
        let request = SearchImageRequest.getImage(stringUrl: resultInfo.appImage)
        let config = RequestConfig(request: request, parser: SearchResultImageParser())
        
        if let image = cacheService.getImage(forKey: resultInfo.appImage) {
            completion(image)
        } else {
            requestManager.perform(config) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let image):
                    completion(image)
                    self.cacheService.insertImage(image, forKey: self.resultInfo.appImage)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
