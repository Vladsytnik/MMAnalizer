//
//  UIStackVIew+Extension.swift
//  baseball_project
//
//  Created by Руслан Осмаев on 15.06.2022.
//

import UIKit

extension UIStackView {
    @discardableResult
    func appendArrangedSubviews(_ subviews: UIView...) -> UIView {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview($0)
        }
        return self
    }
}
