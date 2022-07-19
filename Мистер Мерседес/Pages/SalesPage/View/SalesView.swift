//
//  SalesView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 16.07.2022.
//

import UIKit
import SnapKit

class SalesView: UIView {
    
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
    
    func setupViews() {
        appendSubviews(
            scrollView
                .appendSubviews(
                    view
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
    }
}
