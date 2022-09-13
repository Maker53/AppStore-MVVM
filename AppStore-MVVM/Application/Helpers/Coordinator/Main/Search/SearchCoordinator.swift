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
    
    private let flowTitle = "Search"
    private let tabBarImageName = "magnifyingglass"
    
    lazy var searchViewController: SearchViewController = {
        let viewController = SearchViewController()
        let searchViewModel = SearchViewModel()
        
        viewController.collectionView.backgroundColor = .systemGroupedBackground
        viewController.title = flowTitle
        viewController.searchViewModel = searchViewModel
        
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([searchViewController], animated: true)
    }
}
