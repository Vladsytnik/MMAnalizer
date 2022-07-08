//
//  NewCarPageView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 07.07.2022.
//

import UIKit
import SnapKit

class NewCarPageView: UIView {
    
    struct Constant {
        static var btnCornerRadius: CGFloat = 8
        static var addButtonColor = Colors.blueButton
        static var cancelButtonColor = Colors.grayButton
        static var spacingBetweenTextFields: CGFloat = 25
        static var spacingBetweenButtons: CGFloat = 40
        static var buttonWidth = 135
        static var buttonHeight = 40
    }

    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить", for: .normal)
        button.backgroundColor = Constant.addButtonColor
        button.layer.cornerRadius = Constant.btnCornerRadius
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отменить", for: .normal)
        button.backgroundColor = Constant.cancelButtonColor
        button.layer.cornerRadius = Constant.btnCornerRadius
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var carNameTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер (R11):"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var carCostPriceInRubleTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Себестоимость [р]:"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var carCostPriceInEuroTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Себестоимость [€]:"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var carEarningsTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Выручка:"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var stackViewForTextField: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                carNameTF,
                carCostPriceInRubleTF,
                carCostPriceInEuroTF,
                carEarningsTF
            ]
        )
        stackView.axis = .vertical
        stackView.spacing = Constant.spacingBetweenTextFields
        return stackView
    }()
    
    lazy var stackViewForButton: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                cancelButton,
                addButton
            ]
        )
        stackView.axis = .horizontal
        stackView.spacing = Constant.spacingBetweenButtons
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Constraints
extension NewCarPageView {
    func addConstraints() {
        stackViewForTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.center.equalToSuperview()
        }
        stackViewForButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-70)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constant.buttonHeight)
        }
        cancelButton.snp.makeConstraints { make in
            make.width.equalTo(Constant.buttonWidth)
        }
        addButton.snp.makeConstraints { make in
            make.width.equalTo(Constant.buttonWidth)
        }
    }
    
    func setupViews() {
        appendSubviews(
            stackViewForTextField,
            stackViewForButton
        )
    }
}
