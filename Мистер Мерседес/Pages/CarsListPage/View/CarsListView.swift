//
//  CarListView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit
import SnapKit

class CarsListView: UIView {
    
    struct Constants {
        static let textThenCarsListIsEmpty = "Пока нет ни одного добавленного автомобиля :("
        static let widthForEmptyCarsListLabel = 300
        static let cellID = "cellForCarsList"
    }

    lazy var tableView: UITableView  = {
        let tableView = UITableView()
        return tableView
    }()
    
    lazy var newCarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "plus.square")
        return button
    }()
    
    lazy var emptyCarsListLabel: UILabel = {
        let label = UILabel()
        let text = Constants.textThenCarsListIsEmpty
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        emptyCarsListLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(Constants.widthForEmptyCarsListLabel)
        }
    }
    
    func setupViews() {
        appendSubviews(
            tableView,
            emptyCarsListLabel
        )
    }
}
