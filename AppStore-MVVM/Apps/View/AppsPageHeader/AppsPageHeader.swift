//
//  AppsPageHeader.swift
//  AppStore-MVVM
//
//  Created by Станислав on 19.09.2022.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: AppsPageHeader.self)
    var viewModel: IAppsPageHeaderViewModel!
    
    // MARK: - Private UI Properties
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: AppHeaderCell.identifier)
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure() {
        viewModel.appsPageHeader.bind { [weak self] _ in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: - Private Methods

extension AppsPageHeader {
    
    private func addSubviews() {
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension AppsPageHeader: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AppHeaderCell.identifier,
            for: indexPath
        ) as? AppHeaderCell else {
            return UICollectionViewCell()
        }
        
        let viewModel = viewModel.getAppHeaderCellViewModel(at: indexPath)
        cell.viewModel = viewModel
        cell.configure()
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppsPageHeader: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: frame.width - 3 * Constants.horizontalPadding, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: Constants.horizontalPadding, bottom: 0, right: 0)
    }
}
