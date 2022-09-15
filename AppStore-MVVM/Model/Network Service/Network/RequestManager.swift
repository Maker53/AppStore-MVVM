//
//  RequestManager.swift
//  AppStore-MVVM
//
//  Created by Станислав on 14.09.2022.
//

import Foundation

protocol IRequestManager {
    
    func perform<T>(_ config: RequestConfig<T>, completion: @escaping(Result<T.Model, NetworkError>) -> Void)
}

final class RequestManager: IRequestManager {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform<T>(_ config: RequestConfig<T>, completion: @escaping (Result<T.Model, NetworkError>) -> Void) {
        do {
            let urlRequest = try config.request.createURLRequest()
            
            urlSession.dataTask(with: urlRequest) { data, _, error in
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                guard let parseModel = config.parser.parse(data: data) else {
                    completion(.failure(.parseError))
                    return
                }
                
                completion(.success(parseModel))
            }.resume()
        } catch let error {
            completion(.failure(.invalidURL))
            print(error)
        }
    }
}
