//
//  AppDelegate.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let carsNavController = UINavigationController()
        let monthlyAnalisisNavController = UINavigationController()
        let tabBarController = UITabBarController()

        tabBarController.configure(withControllers: carsNavController, monthlyAnalisisNavController)

        coordinator = Coordinator(with: tabBarController)

        window = UIWindow(frame: UIScreen.main.bounds )
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
