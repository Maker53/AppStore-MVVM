//
//  UIStackView+addArrangedSubviews.swift
//  AppStore-MVVM
//
//  Created by Станислав on 13.09.2022.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
