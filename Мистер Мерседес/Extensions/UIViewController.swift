//
//  UIViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 23.07.2022.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        UIApplication
            .shared
            .sendAction(
                #selector(resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
    }
}
