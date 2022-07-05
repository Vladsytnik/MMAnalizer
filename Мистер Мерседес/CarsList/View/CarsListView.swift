//
//  CarListView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit

class CarsListView: UIView {

    var tableView: UITableView {
        let tableView = UITableView()
        appendSubviews(tableView)
        return tableView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        
    }

}
