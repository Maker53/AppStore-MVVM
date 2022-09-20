//
//  UIButton+createGetButton.swift
//  AppStore-MVVM
//
//  Created by Станислав on 19.09.2022.
//

import UIKit

extension UIButton {
    
    static func createGetButton() -> UIButton {
        let button = UIButton(type: .system)
        
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 16
        
        return button
    }
}
