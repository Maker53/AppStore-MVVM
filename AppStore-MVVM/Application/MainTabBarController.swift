//
//  MainTabBarController.swift
//  AppStore-MVVM
//
//  Created by Станислав on 11.09.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavigationController(viewController: UIViewController(), title: "Today", imageName: "doc.text.image"),
            createNavigationController(viewController: UIViewController(), title: "Apps", imageName: "square.stack.3d.up.fill"),
            createNavigationController(viewController: UIViewController(), title: "Search", imageName: "magnifyingglass")
        ]
    }
    
    private func createNavigationController(
        viewController: UIViewController,
        title: String,
        imageName: String
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        
        viewController.view.backgroundColor = .systemGroupedBackground
        viewController.title = title
        
        return navigationController
    }
}
