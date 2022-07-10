//
//  NewCarPageViewModel.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 10.07.2022.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData

class NewCarPageViewModel {
    
    let carName = ReplaySubject<String>.create(bufferSize: 1)
    let carPriceInRuble = ReplaySubject<String>.create(bufferSize: 1)
    let carPriceInEuro = ReplaySubject<String>.create(bufferSize: 1)
    let carEarnings = ReplaySubject<String>.create(bufferSize: 1)
    
    var context = CoreDataManager.shared.context
    var entityDescription: NSEntityDescription
    var car: Car
    
    let objectName = "Car"
    
    let disposeBag = DisposeBag()
    
    // MARK: - init
    init() {
        entityDescription = CoreDataManager
            .shared
            .getEntityDescription(entityName: objectName)
         let object = CoreDataManager
                .shared
                .getObject(entityName: objectName) as? Car
        car = object ?? Car()
        
        userCreatedNewCar()
    }
    
    func userCreatedNewCar() {
        _ = Observable.zip(carName, carPriceInRuble, carPriceInEuro, carEarnings).subscribe({ event in
            self.car.name = event.element?.0
            self.car.costPriceInRuble = self
                .getFloatFrom(str: event.element?.1)
            self.car.costPriceInEuro = self
                .getFloatFrom(str: event.element?.2)
            self.car.earning = self
                .getFloatFrom(str: event.element?.3)
            
            print(event.element!)
            
            do {
                try self.context.save()
            } catch let error {
                print(error)
            }
        }).disposed(by: disposeBag)
    }
    
    func getFloatFrom(str: String?) -> Float {
        Float(str ?? "") ?? 0.0
    }
    
}
