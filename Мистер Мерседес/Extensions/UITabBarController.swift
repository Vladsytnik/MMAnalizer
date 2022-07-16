//
//  UITabBarController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit

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
