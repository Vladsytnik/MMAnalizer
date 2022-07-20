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
    
    convenience init() {
        let entity = NSEntityDescription
            .entity(forEntityName: CarDataManager.shared.entityName,
                    in: CarDataManager.shared.context) ?? NSEntityDescription
            .insertNewObject(forEntityName: CarDataManager.shared.entityName,
                             into: CarDataManager.shared.context).entity
        
        self.init(entity: entity,
                  insertInto: CarDataManager.shared.context)
    }
}
