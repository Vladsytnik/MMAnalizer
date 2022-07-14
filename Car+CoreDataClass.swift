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
    
    lazy var fetchRequest: NSFetchRequest<Car> = {
        let fetchRequest = NSFetchRequest<Car>(entityName: Self.entityName)
//        let sort = NSSortDescriptor(key: "name", ascending: true)
//        fetchRequest.sortDescriptors = [sort]
        return fetchRequest
    }()
    
    convenience init() {
        let entity = NSEntityDescription
            .entity(forEntityName: Self.entityName,
                    in: Self.context) ?? NSEntityDescription
            .insertNewObject(forEntityName: Self.entityName,
                             into: Self.context).entity
        
        self.init(entity: entity,
                  insertInto: Self.context)
        
//        initFetchResultController()
    }
}

extension Car {
    func getFetchResultController() {
//        fetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>(
//           fetchRequest: NSFetchRequest(entityName: Self.entityName),
//           managedObjectContext: CoreDataManager.shared.context,
//           sectionNameKeyPath: nil,
//           cacheName: nil)
    }
    
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
        let predicate = NSPredicate(format: "%K != %@", "name", "")
        fetchRequest.predicate = predicate
        
        do {
            let car = try CoreDataManager.shared.context.fetch(fetchRequest)
            
            return car
        } catch let error {
            print(error)
        }
        return [Car()]
    }
    
    static func deleteCar(withIndexPath indexPath: IndexPath) {
        let fetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>(
            fetchRequest: NSFetchRequest(entityName: Self.entityName),
            managedObjectContext: CoreDataManager.shared.context,
            sectionNameKeyPath: nil,
            cacheName: nil)

        guard let entity = fetchedResultsController.object(at: indexPath) as? NSManagedObject else {return}
        context.delete(entity)
        
        CoreDataManager.shared.saveContext()
    }
}
