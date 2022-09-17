//
//  ImageCacheService.swift
//  AppStore-MVVM
//
//  Created by Станислав on 17.09.2022.
//

import UIKit

protocol IImageCacheService: AnyObject {
        
    func getImage(forKey key: String) -> UIImage?
    func insertImage(_ image: UIImage, forKey key: String)
}

final class ImageCacheService: IImageCacheService {
    
    static let shared = ImageCacheService()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getImage(forKey key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
    
    func insertImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
