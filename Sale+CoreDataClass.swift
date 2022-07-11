//
//  Sale+CoreDataClass.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 11.07.2022.
//
//

import Foundation
import CoreData

@objc(Sale)
public class Sale: NSManagedObject {
    static let entityName = "Sale"
    
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
