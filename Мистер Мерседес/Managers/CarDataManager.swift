//
//  CarDataManager.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 17.07.2022.
//

import Foundation
import CoreData

protocol CarDataDelegate: AnyObject {
    func insertCar(indexPath: IndexPath)
}

@objc
class CarDataManager: NSObject, NSFetchedResultsControllerDelegate {
    
    static let shared = CarDataManager()
    
    let entityName = "Car"
    let context = CoreDataManager.shared.context
    weak var delegate: CarDataDelegate?
    
    lazy var fetchReq: NSFetchRequest<Car> = {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        let predicate = NSPredicate(format: "%K != %@", "name", "")
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.predicate = predicate
        return fetchRequest
    }()
    
    lazy var resultController: NSFetchedResultsController<Car> = {
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchReq, managedObjectContext: CoreDataManager.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        return fetchedResultsController
    }()
    
    private override init() {
        super.init()
        resultController.delegate = self
    }
}

// MARK: - Data Manipulations
extension CarDataManager {
    func saveData(name: String?,
                  costPriceInRuble: String?,
                  costPriceInEuro: String?,
                  earning: String?) {
        let car = Car()
        car.name = name ?? ""
        car.costPriceInRuble = getFloatFrom(str: costPriceInRuble)
        car.costPriceInEuro = getFloatFrom(str: costPriceInEuro)
        car.earning = getFloatFrom(str: earning)
        car.comeData = Date()
        
        CoreDataManager.shared.saveContext()
    }
    
    func getFloatFrom(str: String?) -> Float {
        Float(str ?? "") ?? 0.0
    }
    
    func getEntities() -> [Car] {
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
    
    func deleteCar(from cars: inout [Car], withIndexPath indexPath: IndexPath) {
        cars.remove(at: indexPath.row)
        
        let obj = resultController.object(at: indexPath)
        let entity = obj as NSManagedObject
        context.delete(entity)
        
        CoreDataManager.shared.saveContext()
    }
    
    @discardableResult
    func numberOfRowsInSection(_ section: Int) -> Int {
        guard let sections = resultController.sections else {return 0}
        return sections[section].numberOfObjects
    }
    
    func getObject(withIndexPath indexPath: IndexPath) -> Car? {
        resultController.object(at: indexPath)
    }
}

extension CarDataManager {
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else {return}
            delegate?.insertCar(indexPath: newIndexPath)
        case .delete:
            break
        case .move:
            break
        case .update:
           break
        @unknown default:
            break
        }
    }
}
