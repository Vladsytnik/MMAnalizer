//
//  UIView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit


extension UIView {
    func appendSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
