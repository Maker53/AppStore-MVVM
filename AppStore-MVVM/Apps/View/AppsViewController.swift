//
//  AppsViewController.swift
//  AppStore-MVVM
//
//  Created by Станислав on 18.09.2022.
//

import UIKit

class AppsViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    
    private let appsViewModel: IAppsViewModel
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        
        spinner.hidesWhenStopped = true
        
        spinner.center = view.center
        
        return spinner
    }()
    
    // MARK: - Initializers
    
    init(viewModel: IAppsViewModel) {
        self.appsViewModel = viewModel
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overridden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.identifier)
        collectionView.register(
            AppsPageHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: AppsPageHeader.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appsViewModel.fetchPageData {
            self.collectionView.reloadData()
            self.isShowLoading(false)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if self.collectionView.numberOfItems(inSection: 0) == 0 {
                self.isShowLoading(true)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension AppsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appsViewModel.numberOfItemsInSection()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AppsGroupCell.identifier,
            for: indexPath
        ) as? AppsGroupCell else {
            return UICollectionViewCell()
        }
        
        let viewModel = appsViewModel.getAppsGroupCellViewModel(at: indexPath)
        cell.viewModel = viewModel
        cell.configure()
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageHeader.identifier, for: indexPath) as? AppsPageHeader else { return UICollectionReusableView() }
        
        let viewModel = appsViewModel.getAppsPageHeaderViewModel()
        header.viewModel = viewModel
        header.configure()
        
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: view.frame.width, height: 300)
    }
}

// MARK: - Private Methods

extension AppsViewController {
    
    private func addSubviews() {
        view.addSubview(activityIndicator)
    }
    
    private func isShowLoading(_ bool: Bool) {
        if bool {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }        
    }
}
