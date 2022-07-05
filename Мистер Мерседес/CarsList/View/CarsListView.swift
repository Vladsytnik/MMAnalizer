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

//        self.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        appendSubviews(tableView)
        return tableView
    }()
    
//     var tableView = UITableView()
    
//    lazy var tableViewCell: UITableViewCell = {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        return cell
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        configureTableView()
        addConstraints()
        self.backgroundColor = .systemPink
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    func configureTableView() {
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        appendSubviews(tableView)
//    }
//
    func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }

}
