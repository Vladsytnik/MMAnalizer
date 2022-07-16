//
//  SalesFlow.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 16.07.2022.
//

import Foundation
import UIKit

class SalesFlow {
    
    var salesViewController: SalesViewController
    var salesViewModel: SalesViewModel

    let navController: UINavigationController

    @discardableResult
    init(navController: UINavigationController) {
        self.navController = navController

        self.salesViewModel = SalesViewModel()
        self.salesViewController = SalesViewController(
            viewModel: salesViewModel
        )

        start()
        configureNavigationController()
    }
}

extension SalesFlow {
    func start() {
        navController.append(viewController: salesViewController)
    }

    func configureNavigationController() {
        navController.navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navController.navigationBar.standardAppearance = navBarAppearance
    }
}
