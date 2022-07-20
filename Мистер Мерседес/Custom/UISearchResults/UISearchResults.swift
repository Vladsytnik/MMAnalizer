//
//  UISearchResults.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 20.07.2022.
//

import UIKit
import SnapKit

class UISearchResults: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "searchResCell")
    }
    
    private func setupViews() {
        appendSubviews(
            tableView
        )
    }
    
    private func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

extension UISearchResults: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResCell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}

extension UISearchResults: UITableViewDelegate {
    
}
