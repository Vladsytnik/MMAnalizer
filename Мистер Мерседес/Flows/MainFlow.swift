//
//  MainPageCoordinator.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit

class MainFlow {

    var tabBarController: UITabBarController?
    
    var salesNavController: UINavigationController?
    var carListNavController: UINavigationController?
    var monthlyAnalizeNavController: UINavigationController?

    init(tabBar: UITabBarController) {
        getNavControllersFrom(tabBar)
        guard let carListNavController = carListNavController else {return}
        guard let salesNavController = salesNavController else {return}
        
        tabBarController?.selectedViewController = carListNavController
        
        CarsListFlow(navController: carListNavController)
        SalesFlow(navController: salesNavController)
    }
}

extension MainFlow {
    func getNavControllersFrom(_ tabBar: UITabBarController) {
        self.tabBarController = tabBar
        self.salesNavController = tabBar.getNextNavController() ?? UINavigationController()
        self.carListNavController = tabBar.getNextNavController() ?? UINavigationController()
        self.monthlyAnalizeNavController = tabBar.getNextNavController() ?? UINavigationController()
    }
    
    func setLaunchNavController() {
        
    }
}
