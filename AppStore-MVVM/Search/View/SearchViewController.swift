//
//  SearchViewController.swift
//  AppStore-MVVM
//
//  Created by Станислав on 11.09.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var mainView: SearchView? {
        view as? SearchView
    }
    
    // MARK: - Private Properties
    
    private let searchViewModel: ISearchViewModel
    private var timer: Timer?
    
    // MARK: - Initializers
    
    init(viewModel: ISearchViewModel) {
        self.searchViewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overridden Methods
    
    override func loadView() {
        view = SearchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView?.collectionView.register(
            SearchResultCell.self,
            forCellWithReuseIdentifier: SearchResultCell.identifier)
        
        mainView?.collectionView.delegate = self
        mainView?.collectionView.dataSource = self
        navigationItem.searchController?.searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchViewModel.fetchApps(searchKeyword: "Telegram") {
            if self.mainView?.collectionView.numberOfItems(inSection: 0) == 0 {
                self.mainView?.collectionView.reloadData()
                self.isShowLoading(false)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if self.mainView?.collectionView.numberOfItems(inSection: 0) == 0 {
                self.isShowLoading(true)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func isShowLoading(_ bool: Bool) {
        if bool {
            self.mainView?.activityIndicator.startAnimating()
        } else {
            self.mainView?.activityIndicator.stopAnimating()
        }
        
        self.mainView?.loadingLabel.isHidden = !bool
    }
}

// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchViewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchResultCell.identifier,
            for: indexPath
        ) as? SearchResultCell else {
            return UICollectionViewCell()
        }
        
        cell.viewModel = searchViewModel.getSearchResultCellViewModel(at: indexPath)
        cell.configure()
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        .init(width: view.frame.width, height: 350)
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        
        if !searchText.isEmpty {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                self.searchViewModel.fetchApps(searchKeyword: searchText) {
                    self.mainView?.collectionView.reloadData()
                }
            }
        }
    }
}
