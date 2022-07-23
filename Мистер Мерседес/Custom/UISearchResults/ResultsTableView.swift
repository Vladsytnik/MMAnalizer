//
//  ResultsTableView.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 21.07.2022.
//

import UIKit
import SnapKit

class ResultsTableView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var completion: ((String) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 0.1
        self.layer.cornerRadius = 5
        
        configureTableView()
        setupSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "searchResCell2")
        
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = UIColor.lightGray
    }
    
    func setupSubviews() {
        appendSubviews(
            tableView
        )
    }
    
    func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func showTableView() {
        tableView.isHidden = false
        tableView.becomeFirstResponder()
    }
    
    func hideTableView() {
        tableView.isHidden = true
    }
}

extension ResultsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResCell2")
        cell?.textLabel?.text = "test"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
}

extension ResultsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        guard let text =  cell?.textLabel?.text else {return}
        tableView.deselectRow(at: indexPath, animated: true)
        completion?(text)
    }
}
