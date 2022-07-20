//
//  SalesViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 16.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

class SalesViewController: UIViewController {
    
    let viewModel: SalesViewModel
    let salesView = SalesView()
    var disposeBag = DisposeBag()

    init(viewModel: SalesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        configureTableView()
//        bindingViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = salesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureThisVC()
    }
    
    func configureThisVC() {
        self.view.backgroundColor = .white
        self.title = "Продажи"
        self.navigationItem.backButtonTitle = "Назад"
    }
    
    func configureTableView() {
        salesView.tableView.dataSource = self
        salesView.tableView.delegate = self
        salesView.tableView.register(SalesTableViewCell.self, forCellReuseIdentifier: "salesCell")
    }
}

extension SalesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "salesCell", for: indexPath) as? SalesTableViewCell else {return UITableViewCell()}
        return cell
    }
}

extension SalesViewController {
//    func bindingViewModel() {
//        let data = Observable<[String]>.just(["first element", "second element", "third element"])
//        data
//            .bind(to: salesView.tableView.rx.items(cellIdentifier: "salesCell", cellType: SalesTableViewCell.self)) { index, elem, cell in
//            }
//    }
}

extension SalesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
