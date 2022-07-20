//
//  SalesViewModel.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 16.07.2022.
//

import Foundation
import RxCocoa
import RxSwift

class SalesViewModel {
    
    struct Output {
        let price: Driver<String>
    }
    
    let name = ReplaySubject<String>.create(bufferSize: 1)
    let price = ReplaySubject<String>.create(bufferSize: 1)
    
    private(set) var output: Output!
    
    let disposeBag = DisposeBag()
    
    init() {
        let price = formattingPrice()
        output = Output(price: price)
    }
    
    func formattingPrice() -> Driver<String> {
        Observable.create { [price] observer in
            price
                .subscribe { event in
                    guard let str = event.element else {return}
                    if str.count > 0 {
                        let res = str + "#"
                        observer.onNext(res)
                    }
                    print(event)
                }
        }
        .asDriver(onErrorJustReturn: "")
    }
}
