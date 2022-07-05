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
    var carListNavController: UINavigationController?
    var monthlyAnalizeNavController : UINavigationController?
    
    init(tabBar: UITabBarController) {
        getNavControllersFrom(tabBar)
        
        guard let carListNavController = carListNavController else {return}
        
        _ = CarsListFlow(navController: carListNavController)
    }
    
    func start() {
        
        
        
    }
}

extension MainFlow {
    func getNavControllersFrom(_ tabBar: UITabBarController) {
        self.tabBarController = tabBar
        self.carListNavController = tabBar.getNextNavController() ?? UINavigationController()
        self.monthlyAnalizeNavController = tabBar.getNextNavController() ?? UINavigationController()
    }
}
