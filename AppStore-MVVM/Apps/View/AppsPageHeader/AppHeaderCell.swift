//
//  AppHeaderCell.swift
//  AppStore-MVVM
//
//  Created by Станислав on 19.09.2022.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: AppHeaderCell.self)
    var viewModel: IAppHeaderCellViewModel!
    
    // MARK: - Private UI Properties
    
    private lazy var overallStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "App name"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Keeping up with friends is faster than ever"
        label.font = .systemFont(ofSize: 24)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemGroupedBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
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

extension AppHeaderCell {
    
    private func addSubviews() {
        overallStackView.addArrangedSubviews(appNameLabel, titleLabel, appImageView)
        
        addSubview(overallStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            overallStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overallStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            overallStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overallStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
