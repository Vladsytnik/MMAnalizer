//
//  UINavigationController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit


extension UINavigationController {
    func append(viewController: UIViewController) {
        self.viewControllers.append(viewController)
    }
}
