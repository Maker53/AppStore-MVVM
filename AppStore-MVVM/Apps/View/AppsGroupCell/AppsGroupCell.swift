//
//  AppsGroupCell.swift
//  AppStore-MVVM
//
//  Created by Станислав on 18.09.2022.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: AppsGroupCell.self)
    var viewModel: IAppsGroupCellViewModel!
    
    // MARK: - Private UI Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "App Section"
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: AppRowCell.identifier)
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGroupedBackground
        
        addSubviews()
        setupConstraints()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension AppsGroupCell {
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.horizontalPadding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.horizontalPadding),
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension AppsGroupCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AppRowCell.identifier,
            for: indexPath
        ) as? AppRowCell else {
            return UICollectionViewCell()
        }
        
        let viewModel = viewModel.getAppRowCellViewModel(at: indexPath)
        cell.viewModel = viewModel
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppsGroupCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = (collectionView.frame.height - 2 * Constants.verticalPadding - 2 * Constants.lineSpasing) / 3
        
        return CGSize(width: frame.width - 3 * Constants.horizontalPadding, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.verticalPadding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: Constants.verticalPadding,
            left: Constants.horizontalPadding,
            bottom: Constants.verticalPadding,
            right: Constants.horizontalPadding)
    }
}
