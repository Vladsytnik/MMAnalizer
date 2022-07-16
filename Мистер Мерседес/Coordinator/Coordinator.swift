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
    let salesNavController = UINavigationController()

    init(with tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        
        configureTabBarItems()
        setupNavControllers()
        
        self.mainFlow = MainFlow(tabBar: tabBarController)
    }
}

extension Coordinator {
    func configureTabBarItems() {
        let carsImage = UIImage(systemName: "list.bullet")
        let profitImage = UIImage(systemName: "dollarsign.square")
        let salesImage = UIImage(systemName: "plus.app")
        
        let carsTitle = "Автомобили"
        let totalProfitTitle = "Прибыль"
        let salesTitle = "Продажи"
        
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
        salesNavController
            .tabBarItem = UITabBarItem(
                title: salesTitle,
                image: salesImage,
                selectedImage: salesImage
            )
    }
    
    func setupNavControllers() {
        self.tabBarController.viewControllers = [
            salesNavController,
            carsNavController,
            monthlyAnalisisNavController
        ]
    }
}
