//
//  UISearchResults.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 20.07.2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class UISearchTextField: UITextField {
    
    lazy var tableView: ResultsTableView = {
        let tableView = ResultsTableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
     
    private func configure() {
        self.delegate = self
        setBinding()
        insertTextFromResults()
    }
    
    private func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(200)
            make.top.equalTo(self.snp_bottomMargin).offset(10)
        }
    }
}

extension UISearchTextField {
    private func showTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)

        tableView.isHidden = false
        self.window?.addSubview(tableView)
        addConstraints()
    }
    
    private func hideTableView() {
        tableView.isHidden = true
        tableView.removeFromSuperview()
    }
}

// MARK: - Binding
extension UISearchTextField {
    func setBinding() {
        self.rx
            .text
            .orEmpty
            .asObservable()
            .subscribe { event in
                guard let str = event.element else {return}
                if str.count > 0 {
                    self.showTableView()
                } else {
                    self.hideTableView()
                }
            }
    }
}

extension UISearchTextField {
    func insertTextFromResults() {
        tableView.completion = { text in
            self.text = text
            self.hideTableView()
            self.resignFirstResponder()
        }
    }
}

extension UISearchTextField: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        hideTableView()
    }
}
