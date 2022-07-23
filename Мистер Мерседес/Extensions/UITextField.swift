//
//  UITextField.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 10.07.2022.
//

import Foundation
import UIKit

extension UITextField {
    func setupToolBar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(clickDone)
        )
        let flexButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        toolBar.setItems([flexButton, doneButton], animated: false)
        inputAccessoryView = toolBar
    }
    
    @objc func clickDone() {
        self.resignFirstResponder()
    }
    
    func isEmpty() -> Bool {
        self.text == ""
    }
}
