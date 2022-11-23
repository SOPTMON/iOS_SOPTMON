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
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.grayColor1, NSAttributedString.Key.font: UIFont(name: "SUIT-Regular", size: 10)!]
        
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.grayColor1, NSAttributedString.Key.font: UIFont(name: "SUIT-Regular", size: 10)!]
        
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance

        tabBar.standardAppearance = tabBarAppearance
    }
    
    func setTabBarViewControllers() {
        
        let homeVC = HomeViewController()
        
        let homeNVC = templateNavigationController(title: "홈화면",
                                                   unselectedImage: ImageLiterals.tabBarHomeDefaultBar,
                                                   selectedImage: ImageLiterals.tabBarHomeSelected,
                                                   rootViewController: homeVC)
        
        let categoryVC = CategoryMainViewController()
        let categoryNVC = templateNavigationController(title: "카테고리",
                                                unselectedImage: ImageLiterals.tabBarCategoryDefault,
                                                       selectedImage: ImageLiterals.tabBarCategorySelected,
                                                     rootViewController: categoryVC)
        
        let mineNVC = templateNavigationController(title: "찜하기",
                                                    unselectedImage: ImageLiterals.tabBarMineDefault,
                                                           selectedImage: ImageLiterals.tabBarMineDefault,
                                                    rootViewController: UIViewController())
        
        let myTmonNVC = templateNavigationController(title: "마이티몬",
                                                        unselectedImage: ImageLiterals.tabBarTmonDefault,
                                                                selectedImage: ImageLiterals.tabBarTmonDefault,
                                                   rootViewController: UIViewController())
        
        viewControllers = [homeNVC, categoryNVC, mineNVC, myTmonNVC]
    }

    func templateNavigationController(title: String, unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.title = title
        nav.tabBarItem.image = unselectedImage?.resize(to: CGSize(width: 18, height: 23)).withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = selectedImage?.resize(to: CGSize(width: 18, height: 23)).withRenderingMode(.alwaysOriginal)
        nav.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        return nav
    }
}
