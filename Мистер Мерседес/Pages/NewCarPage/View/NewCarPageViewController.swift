//
//  NewCarPageViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 07.07.2022.
//

import UIKit
import RxSwift

class NewCarPageViewController: UIViewController {
    
    var newCarPageView = NewCarPageView()
    var textFields: [UITextField] = []
    
    let viewModel = NewCarPageViewModel()
    
    let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = newCarPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureThisVC()
        configureDelegates()
        hideKeyboardWhenTappedAround()
        configureButtonActions()
    }
    
    // MARK: - Functions
    func configureThisVC() {
        self.view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Добавить новый"
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureDelegates() {
        textFields = [
            newCarPageView.carNameTF,
            newCarPageView.carPriceInRubleTF,
            newCarPageView.carPriceInEuroTF,
            newCarPageView.carEarningsTF
        ]
        textFields.forEach {
            $0.delegate = self
        }
    }
    
    func configureButtonActions() {
        newCarPageView
            .cancelButton
            .addTarget(self,
                       action: #selector(clickOnCancelButton),
                       for: .touchUpInside)
        newCarPageView
            .addButton
            .addTarget(self,
                       action: #selector(clickOnAddButton),
                       for: .touchUpInside)
    }
}

// MARK: - Actions
extension NewCarPageViewController {
    @objc func clickOnCancelButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func clickOnAddButton() {
        if newCarPageView.carNameTF.isEmpty() {
            showAlert()
            return
        }
        
        navigationController?.popViewController(animated: true)
        viewModel.carName.onNext(newCarPageView.carNameTF.text!)
        viewModel.carEarnings.onNext(newCarPageView.carEarningsTF.text!)
        viewModel.carPriceInEuro.onNext(newCarPageView.carPriceInEuroTF.text!)
        viewModel.carPriceInRuble.onNext(newCarPageView.carPriceInRubleTF.text!)
    }
    
    func showAlert() {
        let title = "Упс 😵‍💫"
        let message = "Невозможно добавить новый автомобиль без его номера. Пожалуйста, заполните поле Номер"
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "Заполнить"), style: .default, handler: {_ in
            self.newCarPageView.carNameTF.becomeFirstResponder()
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITextFieldDelegate
extension NewCarPageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFields[0]:
            textFields[1].becomeFirstResponder()
        case textFields[1]:
            textFields[2].becomeFirstResponder()
        case textFields[2]:
            textFields[3].becomeFirstResponder()
        default:
            textFields[3].resignFirstResponder()
        }
        return true
    }
}
