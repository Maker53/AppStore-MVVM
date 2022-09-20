//
//  AppsCoordinator.swift
//  AppStore-MVVM
//
//  Created by Станислав on 12.09.2022.
//

import UIKit

class AppsCoordinator: Coordinator {
    
    lazy var rootViewController: UINavigationController = {
        let navigationController = UINavigationController()
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.title = flowTitle
        navigationController.tabBarItem.image = UIImage(systemName: tabBarImageName)
        
        return navigationController
    }()
    
    private let flowTitle = "Apps"
    private let tabBarImageName = "square.stack.3d.up.fill"
    
    private lazy var appsViewController: AppsViewController = {
        let appsViewModel = AppsViewModel()
        let viewController = AppsViewController(viewModel: appsViewModel)
        
        viewController.collectionView.backgroundColor = .systemGroupedBackground
        viewController.title = flowTitle
        
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([appsViewController], animated: true)
    }
}
