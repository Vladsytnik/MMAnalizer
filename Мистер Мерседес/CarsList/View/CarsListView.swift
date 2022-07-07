//
//  CarListView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit
import SnapKit

class CarsListView: UIView {

    lazy var tableView: UITableView  = {
        let tableView = UITableView()
        appendSubviews(tableView)
        return tableView
    }()
    
    lazy var newCarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "plus.square")
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        self.backgroundColor = .systemPink
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
