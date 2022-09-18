//
//  SomeNameCell.swift
//  AppStore-MVVM
//
//  Created by Станислав on 18.09.2022.
//

import UIKit

class SomeNameCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: SomeNameCell.self)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
