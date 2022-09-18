//
//  IRequest.swift
//  AppStore-MVVM
//
//  Created by Станислав on 14.09.2022.
//

import Foundation

protocol IRequest {
    
    var stringUrl: String { get }
    var path: String { get }
    var requestType: RequestType { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
}

// MARK: - Default RequestProtocol

extension IRequest {
    
    var stringUrl: String {
        ""
    }
    
    var path: String {
        ""
    }
    
    var host: String {
        APIConstants.host
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var urlParams: [String: String?] {
        [:]
    }
    
    var headers: [String: String] {
        [:]
    }
    
    func createURLRequest() throws -> URLRequest {
        let url: URL
        
        if !stringUrl.isEmpty {
            url = try getUrlFromString()
        } else {
            url = try getUrlFromComponents()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
    
    private func getUrlFromComponents() throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if !urlParams.isEmpty {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        
        return url
    }
    
    private func getUrlFromString() throws -> URL {
        guard let url = URL(string: stringUrl) else { throw NetworkError.invalidURL }
        
        return url
    }
}
