//
//  ViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit

class CarsListViewController: UIViewController {
    
    var viewModel: CarsListViewModel
    let carsListView = CarsListView()
    
    init(viewModel: CarsListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        carsListView.tableView.dataSource = self
        carsListView.tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Автомобили"
        view = carsListView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        carsListView.addConstraints()
    }
}

extension CarsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "test"
        return cell ?? UITableViewCell()
    }
}

extension CarsListViewController: UITableViewDelegate {
    
}


