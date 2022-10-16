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
        
        imageView.backgroundColor = .secondarySystemGroupedBackground
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        
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
    
    private lazy var getAppButton = UIButton.createGetButton()
    
    lazy var screenshotImageViews: [UIImageView] = {
        let firstScreenshotImageView = createScreenshotImageView()
        let secondScreenshotImageView = createScreenshotImageView()
        let thirdScreenshotImageView = createScreenshotImageView()
        
        return [firstScreenshotImageView, secondScreenshotImageView, thirdScreenshotImageView]
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
    
    // MARK: - Public Methods
    
    func configure() {
        appImageView.image = nil
        screenshotImageViews.forEach {
            $0.image = nil
        }
        
        viewModel.getAppImage { [unowned(unsafe) self] image in
            appImageView.image = image
        }
        
        viewModel.getScreenshots { [unowned(unsafe) self] screenshot, counter in
            self.screenshotImageViews[counter].image = screenshot
        }
        
        appNameLabel.text = viewModel.appName
        appCategoryLabel.text = viewModel.appCategory
    }
}

// MARK: - Private Methods

extension SearchResultCell {
    
    private func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .secondarySystemGroupedBackground
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray4.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    private func addSubviews() {
        addSubview(overallStackView)
    }
    
    private func setupConstraints() {
        labelsStackView.addArrangedSubviews(appNameLabel, appCategoryLabel, appRatingsLabel)
        appInfoStackView.addArrangedSubviews(appImageView, labelsStackView, getAppButton)
        
        screenshotImageViews.forEach {
            screenshotsStackView.addArrangedSubview($0)
        }
        
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
