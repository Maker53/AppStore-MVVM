//
//  TodayCoordinator.swift
//  AppStore-MVVM
//
//  Created by Станислав on 12.09.2022.
//

import UIKit

class TodayCoordinator: Coordinator {
    
    lazy var rootViewController: UINavigationController = {
        let navigationController = UINavigationController()
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.title = flowTitle
        navigationController.tabBarItem.image = UIImage(systemName: tabBarImageName)
        
        return navigationController
    }()
    
    private let flowTitle = "Today"
    private let tabBarImageName = "doc.text.image"
    
    private lazy var todayViewController: UIViewController = {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .systemGroupedBackground
        viewController.title = flowTitle
        
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([todayViewController], animated: true)
    }
}
