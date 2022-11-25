//
//  TabBarViewController.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/16.
//

import UIKit


import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarViewControllers()
        setUI()
    }
    
    //MARK: - Helpers
    func setUI() {
        tabBar.backgroundColor = .white
    }
    
    func setTabBarViewControllers() {
        
        let homeVC = HomeViewController()
        
        let homeNVC = templateNavigationController(unselectedImage: ImageLiterals.tabBarHomeDefaultBar,
                                                   selectedImage: ImageLiterals.tabBarHomeSelected,
                                                   rootViewController: homeVC)
        
        let categoryVC = CategoryMainViewController()
        let categoryNVC = templateNavigationController(unselectedImage: ImageLiterals.tabBarCategoryDefault,
                                                       selectedImage: ImageLiterals.tabBarCategorySelected,
                                                     rootViewController: categoryVC)
        
        let mineNVC = templateNavigationController(unselectedImage: ImageLiterals.tabBarMineDefault,
                                                           selectedImage: ImageLiterals.tabBarMineDefault,
                                                    rootViewController: UIViewController())
        
        let myTmonNVC = templateNavigationController(unselectedImage: ImageLiterals.tabBarTmonDefault,
                                                                selectedImage: ImageLiterals.tabBarTmonDefault,
                                                   rootViewController: UIViewController())
        
        viewControllers = [homeNVC, categoryNVC, mineNVC, myTmonNVC]
    }

    func templateNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage?.resize(to: CGSize(width: 43, height: 48)).withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = selectedImage?.resize(to: CGSize(width: 43, height: 48)).withRenderingMode(.alwaysOriginal)
        nav.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        nav.navigationItem.backBarButtonItem?.tintColor = .black
        return nav
    }
}
