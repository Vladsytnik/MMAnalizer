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
    
    let disposeBag = DisposeBag()
    
    // MARK: - init
    init() {
        userCreatedNewCar()
    }
    
    func userCreatedNewCar() {
        _ = Observable.zip(carName, carPriceInRuble, carPriceInEuro, carEarnings).subscribe({ event in
            CarDataManager
                .shared
                .saveData(
                    name: event.element?.0,
                    costPriceInRuble: event.element?.1,
                    costPriceInEuro: event.element?.2,
                    earning: event.element?.3
                )
            print("Созданный элемент: \n\(event.element!)")
        }).disposed(by: disposeBag)
    }
}
