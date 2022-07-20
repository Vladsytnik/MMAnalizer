//
//  SalesRow.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 19.07.2022.
//

import UIKit

class SalesCell: UITableViewCell {
    
    struct Constants {
        static let spacing: CGFloat = 8
    }
    
    override init() {
        super.init(coder: NSCoder())
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
       
    }

}
