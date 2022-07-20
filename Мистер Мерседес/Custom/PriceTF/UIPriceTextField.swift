//
//  UIPriceTextField.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 20.07.2022.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class UIPriceTextField: UITextField {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.layer.zPosition = 1
        return label
    }()
    
    let disposeBag = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        appendSubviews(
            label
        )
    }
    
    func addConstraints() {
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.top.bottom.equalToSuperview()
        }
    }
    
    func configure() {
        self.placeholder = "Цена"
        self.borderStyle = .roundedRect
        self.keyboardType = .numberPad
        self.textColor = .white
        setBinding()
    }
}

extension UIPriceTextField {
    private func setBinding() {
        self
            .rx
            .text
            .orEmpty
            .map({ str in
                if str.count > 0 {
                    return self.formatPrice(from: str) + "₽"
                }
                return str
            })
            .bind(to: label
                    .rx
                    .text)
            .disposed(by: disposeBag)
    }
    
    private func formatPrice(from str: String) -> String {
        var result = ""
        let pattern = "\\d{1,3}(?=(\\d{3})+(?!\\d))"
        
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            
            var range = NSRange()
            range.location = 0
            range.length = str.count
            
            result = regex
                .stringByReplacingMatches(
                    in: str,
                    options: [],
                    range: range,
                    withTemplate: "$0 "
                )
        } catch let error {
            print("error in regular expression: \(error)")
        }
        
        return result
    }
}
