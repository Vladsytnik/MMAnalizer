//
//  Car+CoreDataClass.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 11.07.2022.
//
//

import Foundation
import CoreData

@objc(Car)
public class Car: NSManagedObject {
    
    static let entityName = "Car"
    
    convenience init() {
        let context = CoreDataManager.shared.context
        let entity = NSEntityDescription.entity(
            forEntityName: Self.entityName,
            in: context
        ) ?? NSEntityDescription.insertNewObject(
            forEntityName: Self.entityName,
            into: context
        )
            .entity
        
        self.init(entity: entity, insertInto: context)
    }
}

extension Car {
    func saveData(name: String?,
                  costPriceInRuble: String?,
                  costPriceInEuro: String?,
                  earning: String?) {
        self.name = name ?? ""
        self.costPriceInRuble = getFloatFrom(str: costPriceInRuble)
        self.costPriceInEuro = getFloatFrom(str: costPriceInEuro)
        self.earning = getFloatFrom(str: earning)
        self.comeData = Date()
        
        CoreDataManager.shared.saveContext()
    }
    
    func getFloatFrom(str: String?) -> Float {
        Float(str ?? "") ?? 0.0
    }
    
    static func getEntities() -> [Car] {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        
        do {
            let car = try CoreDataManager.shared.context.fetch(fetchRequest)
            return car
        } catch let error {
            print(error)
        }
        return [Car()]
    }
}
