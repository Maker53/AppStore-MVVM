//
//  RequestConfig.swift
//  AppStore-MVVM
//
//  Created by Станислав on 15.09.2022.
//

struct RequestConfig<T: IParser> {
    
    let request: IRequest
    let parser: T
}
