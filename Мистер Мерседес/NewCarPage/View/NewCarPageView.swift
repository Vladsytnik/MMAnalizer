//
//  NewCarPageView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 07.07.2022.
//

import UIKit
import SnapKit

class NewCarPageView: UIView {
    
    struct Constants {
        static var btnCornerRadius: CGFloat = 8
        static var addButtonColor = Colors.blueButton
        static var cancelButtonColor = Colors.grayButton
        static var spacingBetweenTextFields: CGFloat = 25
        static var spacingBetweenButtons: CGFloat = 40
        static var buttonWidth = 135
        static var buttonHeight = 40
        
        static var carNamePlaceholder = "Номер (R11):"
        static var carPriceInRublePlaceholder = "Себестоимость [р]:"
        static var carPriceInEuroPlaceholder = "Себестоимость [€]:"
        static var carEarningsPlaceholder = "Выручка:"
    }

    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить", for: .normal)
        button.backgroundColor = Constants.addButtonColor
        button.layer.cornerRadius = Constants.btnCornerRadius
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отменить", for: .normal)
        button.backgroundColor = Constants.cancelButtonColor
        button.layer.cornerRadius = Constants.btnCornerRadius
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var carNameTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.carNamePlaceholder
        textField.returnKeyType = .continue
        return textField
    }()
    
    lazy var carPriceInRubleTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.carPriceInRublePlaceholder
        textField.returnKeyType = .continue
        textField.setupToolBar()
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    lazy var carPriceInEuroTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.carPriceInEuroPlaceholder
        textField.returnKeyType = .continue
        textField.setupToolBar()
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    lazy var carEarningsTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.carEarningsPlaceholder
        textField.returnKeyType = .done
        textField.setupToolBar()
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    lazy var stackViewForTextField: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.spacingBetweenTextFields
        return stackView
    }()
    
    lazy var stackViewForButton: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Constants.spacingBetweenButtons
        return stackView
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Functions
extension NewCarPageView {
    func setupViews() {
        appendSubviews(
            stackViewForTextField.appendArrangedSubviews(
                carNameTF,
                carPriceInRubleTF,
                carPriceInEuroTF,
                carEarningsTF
            ),
            stackViewForButton.appendArrangedSubviews(
                cancelButton,
                addButton
            )
        )
        
        [carNameTF, carEarningsTF, carPriceInEuroTF, carPriceInRubleTF]
            .forEach {
                $0.borderStyle = .roundedRect
                $0.enablesReturnKeyAutomatically = true
                // $0.setupToolBar()
            }
    }
    
    func addConstraints() {
//        scrollView.snp.makeConstraints { make in
//            make.leading.trailing.top.bottom.equalToSuperview()
//        }
        stackViewForTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(40)
        }
        stackViewForButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-70)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.buttonHeight)
        }
        cancelButton.snp.makeConstraints { make in
            make.width.equalTo(Constants.buttonWidth)
        }
        addButton.snp.makeConstraints { make in
            make.width.equalTo(Constants.buttonWidth)
        }
        [carNameTF, carEarningsTF, carPriceInEuroTF, carPriceInRubleTF]
            .forEach {
                $0.snp.makeConstraints { make in
                    make.height.equalTo(40)
                }
            }
    }

}
