//
//  MainCoordinator.swift
//  AppStore-MVVM
//
//  Created by Станислав on 12.09.2022.
//

import UIKit

class MainCoordinator: Coordinator {
    
    lazy var rootViewController = UITabBarController()
    var childCoordinators = [Coordinator]()
    
    func start() {
        let appsCoordinator = AppsCoordinator()
        appsCoordinator.start()
        childCoordinators.append(appsCoordinator)
        
        let searchCoordinator = SearchCoordinator()
        searchCoordinator.start()
        childCoordinators.append(searchCoordinator)
        
        rootViewController.viewControllers = [
            appsCoordinator.rootViewController,
            searchCoordinator.rootViewController
        ]
    }
}
