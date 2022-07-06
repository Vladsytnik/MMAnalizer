//
//  Coordinator.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit

class Coordinator {

    let mainFlow: MainFlow
    let tabBarController: UITabBarController

    init(with tabBarController: UITabBarController) {
        self.tabBarController = tabBarController

        self.mainFlow = MainFlow(tabBar: tabBarController)
    }
}

extension Coordinator {
    func customizeTabBarController() {

    }
}
