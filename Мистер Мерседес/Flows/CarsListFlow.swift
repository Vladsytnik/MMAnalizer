//
//  CarsListFlow.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit

class CarsListFlow {

    var carsListViewController: CarsListViewController
    var carsListViewModel: CarsListViewModel

    let navController: UINavigationController

    @discardableResult
    init(navController: UINavigationController) {
        self.navController = navController

        self.carsListViewModel = CarsListViewModel()
        self.carsListViewController = CarsListViewController(
            viewModel: carsListViewModel
        )

        start()
        configureNavigationController()
    }
}

extension CarsListFlow {
    func start() {
        navController.append(viewController: carsListViewController)
    }

    func configureNavigationController() {
        navController.navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navController.navigationBar.standardAppearance = navBarAppearance
    }
}
