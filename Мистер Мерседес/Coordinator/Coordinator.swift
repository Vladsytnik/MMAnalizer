//
//  Coordinator.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit

class Coordinator {

    var mainFlow: MainFlow?
    let tabBarController: UITabBarController
    
    let carsNavController = UINavigationController()
    let monthlyAnalisisNavController = UINavigationController()

    init(with tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        
        configureTabBarItems()
        addNavControllersInTabBar()
        
        self.mainFlow = MainFlow(tabBar: tabBarController)
    }
}

extension Coordinator {
    func configureTabBarItems() {
        let carsImage = UIImage(systemName: "list.bullet")
        let profitImage = UIImage(systemName: "dollarsign.square")
        
        let carsTitle = "Автомобили"
        let totalProfitTitle = "Прибыль"
        
        carsNavController
            .tabBarItem = UITabBarItem(
                title: carsTitle,
                image: carsImage,
                selectedImage: carsImage
            )
        monthlyAnalisisNavController
            .tabBarItem = UITabBarItem(
                title: totalProfitTitle,
                image: profitImage,
                selectedImage: profitImage
            )
    }
    
    func addNavControllersInTabBar() {
        self.tabBarController.viewControllers = [carsNavController, monthlyAnalisisNavController]
    }
}
