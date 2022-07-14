//
//  DBHelper.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 10.07.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {
        
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func getEntityDescription(entityName name: String) -> NSEntityDescription {
        NSEntityDescription
            .entity(
                forEntityName: name,
                in: self.context
            ) ?? .init()
    }
    
    func getObject(entityName name: String) -> NSManagedObject {
        NSManagedObject(
            entity: self.getEntityDescription(entityName: name),
            insertInto: self.context
        )
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchedResultsController(entityName: String) -> NSFetchedResultsController<Car> {
        let fetchRequest = NSFetchRequest<Car>(entityName: entityName)
        let sort = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sort]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }
}

extension CoreDataManager {
    
}
