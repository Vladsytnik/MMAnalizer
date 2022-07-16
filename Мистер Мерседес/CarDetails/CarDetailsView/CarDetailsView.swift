//
//  CarDetailsView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 15.07.2022.
//

import UIKit
import SnapKit

class CarDetailsView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    lazy var cost: UILabel = {
        let label = UILabel()
        label.text = "Себестоимость: "
        return label
    }()
    
    lazy var earn: UILabel = {
        let label = UILabel()
        label.text = "Выручка за все время: "
        return label
    }()
    
    lazy var netProfit: UILabel = {
        let label = UILabel()
        label.text = "Чистая прибыль за все время: "
        return label
    }()
    
    lazy var paidOffInProcent: UILabel = {
        let label = UILabel()
        label.text = "Окупилась на [%]: "
        return label
    }()
    
    lazy var dateOfComing: UILabel = {
        let label = UILabel()
        label.text = "Дата прибытия: "
        return label
    }()
    
    lazy var tableView: UITableView  = {
        let tableView = UITableView()
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(
            scrollView
                .appendSubviews(
                    view
                        .appendSubviews(
                            vStack
                                .appendArrangedSubviews(
                                    cost,
                                    earn,
                                    netProfit,
                                    paidOffInProcent,
                                    dateOfComing
                                ),
                            tableView
                        )
                )
        )
    }
    
    func addConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        vStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(vStack.snp_bottomMargin).offset(16)
            make.bottom.equalToSuperview()
        }
    }
}
