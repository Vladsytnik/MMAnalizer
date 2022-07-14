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
    static let context = CoreDataManager.shared.context
    
    static var fetchReq: NSFetchRequest<Car> = {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        let predicate = NSPredicate(format: "%K != %@", "name", "")
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.predicate = predicate
        return fetchRequest
    }()
    
    static var resultController: NSFetchedResultsController<Car> = {
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchReq, managedObjectContext: CoreDataManager.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }()
    
    convenience init() {
        let entity = NSEntityDescription
            .entity(forEntityName: Self.entityName,
                    in: Self.context) ?? NSEntityDescription
            .insertNewObject(forEntityName: Self.entityName,
                             into: Self.context).entity
        
        self.init(entity: entity,
                  insertInto: Self.context)
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
        let predicate = NSPredicate(format: "%K != %@", "name", "")
        fetchReq.predicate = predicate
        
        do {
            let car = try CoreDataManager.shared.context.fetch(fetchReq)
            
            return car
        } catch let error {
            print(error)
        }
        return [Car()]
    }
    
    static func deleteCar(withIndexPath indexPath: IndexPath) {
        guard let entity = resultController.object(at: indexPath) as? NSManagedObject else {return}
        context.delete(entity)
        
        CoreDataManager.shared.saveContext()
    }
}
