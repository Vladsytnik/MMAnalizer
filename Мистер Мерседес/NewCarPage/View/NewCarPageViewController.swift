//
//  NewCarPageViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 07.07.2022.
//

import UIKit

class NewCarPageViewController: UIViewController {
    
    var newCarPageView = NewCarPageView()
    var textFields: [UITextField] = []
    
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
    }
    
    func configureDelegates() {
        textFields = [
            newCarPageView.carNameTF,
            newCarPageView.carCostPriceInRubleTF,
            newCarPageView.carCostPriceInEuroTF,
            newCarPageView.carEarningsTF
        ]
        textFields.forEach {
            $0.delegate = self
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func configureButtonActions() {
        newCarPageView
            .cancelButton
            .addTarget(self,
                       action: #selector(clickOnCancelButton),
                       for: .touchUpInside)
    }

}

// MARK: - Actions
extension NewCarPageViewController {
    @objc func clickOnCancelButton() {
        navigationController?.popViewController(animated: true)
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
