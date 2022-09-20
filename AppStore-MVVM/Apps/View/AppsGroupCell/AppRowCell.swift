//
//  AppRowCell.swift
//  AppStore-MVVM
//
//  Created by Станислав on 18.09.2022.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: AppRowCell.self)
    
    // MARK: - Private UI Properties
    
    private lazy var overallStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .secondarySystemGroupedBackground
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "App Name"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var companyNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Company name"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var getAppButton = UIButton.createGetButton()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGroupedBackground
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension AppRowCell {
    
    private func addSubviews() {
        labelsStackView.addArrangedSubviews(appNameLabel, companyNameLabel)
        overallStackView.addArrangedSubviews(appImageView, labelsStackView, getAppButton)
        
        addSubview(overallStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            overallStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overallStackView.topAnchor.constraint(equalTo: topAnchor),
            overallStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overallStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            appImageView.widthAnchor.constraint(equalToConstant: 64),
            appImageView.heightAnchor.constraint(equalToConstant: 64),
            
            getAppButton.widthAnchor.constraint(equalToConstant: 80),
            getAppButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
