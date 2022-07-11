//
//  Sale+CoreDataProperties.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 11.07.2022.
//
//

import Foundation
import CoreData

extension Sale {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sale> {
        return NSFetchRequest<Sale>(entityName: "Sale")
    }

    @NSManaged public var cost: Float
    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var car: Car?

}

extension Sale: Identifiable {

}
