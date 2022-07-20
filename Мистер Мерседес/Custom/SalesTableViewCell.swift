//
//  SalesTableViewCell.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 19.07.2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SalesTableViewCell: UITableViewCell {
    
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var carNameTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var salesDescriptionTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Запчасть"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var priceTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Цена"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.textColor = .white
        return textField
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.layer.zPosition = 1
        return label
    }()
    
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addContraints()
        setBinding()
    }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
      }
    
    func setupViews() {
        contentView
            .appendSubviews(
                hStackView.appendArrangedSubviews(
                    carNameTF,
                    salesDescriptionTF,
                    priceTF.appendSubviews(
                        label
                    )
                )
            )
    }
    
    func addContraints() {
        hStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(48)
        }
        carNameTF.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
        priceTF.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.top.bottom.equalToSuperview()
        }
    }
    
    func setBinding() {
        priceTF
            .rx
            .text
            .orEmpty
            .map({ str in
                if str.count > 0 {
//                    self.insertNewRow()
                    return self.formatPrice(from: str) + "₽"
                }
                return str
            })
            .bind(to: label
                    .rx
                    .text)
        
    }
    
    func formatPrice(from str: String) -> String {
        var result = ""
        let pattern = "\\d{1,3}(?=(\\d{3})+(?!\\d))"
        
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            
            var range = NSRange()
            range.location = 0
            range.length = str.count
            
            result = regex.stringByReplacingMatches(in: str, options: [], range: range, withTemplate: "$0 ")
        } catch let error {
            print("error in regular expression: \(error)")
        }
        
        return result
    }
    
    func insertNewRow(completion: (()->()) ) {
        completion()
    }
}
