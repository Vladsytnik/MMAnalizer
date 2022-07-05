//
//  UITabBarController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit


extension UITabBarController {
    static var imagesForTabBars: [UIImage?] = [UIImage(systemName: "list.bullet"),
                                               UIImage(systemName: "dollarsign.square")]
    static var titlesForTabBars: [String] = ["Автомобили",
                                             "Прибыль"]
    
    func configure(withControllers navControllers: UINavigationController...) {
        var tabBarIndex = 0
        
        for navController in navControllers {
            navController.tabBarItem = UITabBarItem(
                title: UITabBarController.titlesForTabBars[tabBarIndex],
                image: UITabBarController.imagesForTabBars[tabBarIndex],
                selectedImage: UITabBarController.imagesForTabBars[tabBarIndex]
            )
            tabBarIndex += 1
        }
        self.viewControllers = navControllers
    }
}

extension UITabBarController {
    
    static var navControllerIndex = 0
    
    func getNextNavController() -> UINavigationController? {
        let navController = self.viewControllers?[
            UITabBarController.navControllerIndex
        ] as? UINavigationController
        
        UITabBarController.navControllerIndex += 1
        
        if navController == self.viewControllers?.last {
            UITabBarController.navControllerIndex = 0
        }
        
        return navController
    }
}
