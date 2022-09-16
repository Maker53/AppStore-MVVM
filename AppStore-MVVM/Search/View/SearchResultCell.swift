//
//  SearchResultCell.swift
//  AppStore-MVVM
//
//  Created by Станислав on 12.09.2022.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: SearchResultCell.self)
    var viewModel: ISearchResultCellViewModel!
    
    // MARK: - Private UI Properties
    
    private lazy var overallStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.spacing = 16
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private lazy var appInfoStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.spacing = 12
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private lazy var screenshotsStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.spacing = 12
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "App Name"
        
        return label
    }()
    
    private lazy var appCategoryLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Photos & Video"
        
        return label
    }()
    
    private lazy var appRatingsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "9.26M"
        
        return label
    }()
    
    private lazy var getAppButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var firstScreenshotImageView = createScreenshotImageView()
    lazy var secondScreenshotImageView = createScreenshotImageView()
    lazy var thirdScreenshotImageView = createScreenshotImageView()
    
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
    
    // MARK: - Public Methods
    
    func configure() {
        appNameLabel.text = viewModel.appName
        appCategoryLabel.text = viewModel.appCategory
    }
}

// MARK: - Private Methods

extension SearchResultCell {
    
    private func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .blue
        
        return imageView
    }
    
    private func addSubviews() {
        addSubview(overallStackView)
    }
    
    private func setupConstraints() {
        labelsStackView.addArrangedSubviews(appNameLabel, appCategoryLabel, appRatingsLabel)
        appInfoStackView.addArrangedSubviews(appImageView, labelsStackView, getAppButton)
        screenshotsStackView.addArrangedSubviews(firstScreenshotImageView, secondScreenshotImageView, thirdScreenshotImageView)
        overallStackView.addArrangedSubviews(appInfoStackView, screenshotsStackView)
        
        NSLayoutConstraint.activate([
            overallStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            overallStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overallStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            overallStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            appImageView.widthAnchor.constraint(equalToConstant: 64),
            appImageView.heightAnchor.constraint(equalToConstant: 64),
            
            getAppButton.widthAnchor.constraint(equalToConstant: 80),
            getAppButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
