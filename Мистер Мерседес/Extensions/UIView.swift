//
//  UIView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import Foundation
import UIKit

extension UIView {
    @discardableResult func appendSubviews(_ views: UIView...) -> UIView {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
        return self
    }
}
