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
    
}

extension AppDelegate {
    // Для тестирования БД
    func getDataFromDB() {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        
        do {
            let car = try context.fetch(fetchRequest)
            print("\nВ БД при запуске следующие данные:")
            car.forEach { car in
                print("\(car.name!) \(car.costPriceInRuble) \(car.costPriceInEuro) \(car.earning)")
            }
        } catch let error {
            print(error)
        }
    }
}
