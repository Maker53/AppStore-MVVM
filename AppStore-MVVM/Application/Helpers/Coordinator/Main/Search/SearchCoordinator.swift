//
//  SearchCoordinator.swift
//  AppStore-MVVM
//
//  Created by Станислав on 12.09.2022.
//

import UIKit

class SearchCoordinator: Coordinator {
    
    lazy var rootViewController: UINavigationController = {
        let navigationController = UINavigationController()
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.title = flowTitle
        navigationController.tabBarItem.image = UIImage(systemName: tabBarImageName)
        
        return navigationController
    }()
    
    lazy var searchViewController: SearchViewController = {
        let searchViewModel = SearchViewModel()
        let viewController = SearchViewController(viewModel: searchViewModel)
        
        viewController.navigationItem.searchController = searchController
        viewController.mainView?.collectionView.backgroundColor = .systemGroupedBackground
        viewController.title = flowTitle
        
        return viewController
    }()
    
    lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        
        controller.obscuresBackgroundDuringPresentation = false
        
        return controller
    }()
    
    private let flowTitle = "Search"
    private let tabBarImageName = "magnifyingglass"
    
    func start() {
        rootViewController.setViewControllers([searchViewController], animated: true)
    }
}
