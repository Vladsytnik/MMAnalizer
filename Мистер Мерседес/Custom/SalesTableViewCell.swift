//
//  SalesTableViewCell.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 19.07.2022.
//

import UIKit
import SnapKit

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
        textField.keyboardType = .decimalPad
        textField.textColor = .systemPink
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addContraints()
    }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews() {
        contentView
            .appendSubviews(
                hStackView.appendArrangedSubviews(
                    carNameTF,
                    salesDescriptionTF,
                    priceTF
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
    }
}
