//
//  Car+CoreDataProperties.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 11.07.2022.
//
//

import Foundation
import CoreData

extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var comeData: Date?
    @NSManaged public var costPriceInEuro: Float
    @NSManaged public var costPriceInRuble: Float
    @NSManaged public var earning: Float
    @NSManaged public var name: String
    @NSManaged public var sales: NSSet?

}

// MARK: Generated accessors for sales
extension Car {

    @objc(addSalesObject:)
    @NSManaged public func addToSales(_ value: Sale)

    @objc(removeSalesObject:)
    @NSManaged public func removeFromSales(_ value: Sale)

    @objc(addSales:)
    @NSManaged public func addToSales(_ values: NSSet)

    @objc(removeSales:)
    @NSManaged public func removeFromSales(_ values: NSSet)

}

extension Car: Identifiable {

}
