//
//  AppDelegate.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit
import CoreData

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
        
        getDataFromDB()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataManager.shared.saveContext()
    }
    
}

extension AppDelegate {
    // Для тестирования БД
    func getDataFromDB() {
        let cars = Car.getEntities()
        
        print("\nВ БД при запуске следующие данные:")
        cars.forEach {
            print("\($0.name) \($0.costPriceInRuble) \($0.costPriceInEuro) \($0.earning) \($0.comeData)")
        }
    }
}
