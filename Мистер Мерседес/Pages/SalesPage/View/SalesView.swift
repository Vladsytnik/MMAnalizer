//
//  SalesView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 16.07.2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SalesView: UIView {
    
    struct Constants {
        static let vSpacing: CGFloat = 8
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupViews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemPink
    }
}

extension SalesView {
    func setupViews() {
        appendSubviews(
            scrollView
                .appendSubviews(
                    view.appendSubviews(
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
            make.width.height.equalTo(scrollView)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
