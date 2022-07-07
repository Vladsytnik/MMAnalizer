//
//  ViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit

class CarsListViewController: UIViewController {

    let viewModel: CarsListViewModel
    let carsListView = CarsListView()

    // MARK: - init
    init(viewModel: CarsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        configureTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Viwe life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureThisVC()
        configureRightBarButtonItem()
    }

    override func loadView() {
        view = carsListView
    }
    
    // MARK: - Functions
    func configureTableView() {
        carsListView.tableView.dataSource = self
        carsListView.tableView.delegate = self
    }
    
    func configureThisVC() {
        self.view.backgroundColor = .white
        self.title = "Автомобили"
    }
    
    func configureRightBarButtonItem() {
        carsListView.newCarButtonItem.target = self
        carsListView.newCarButtonItem.action = #selector(clickAddNewCar)
        self.navigationItem
            .rightBarButtonItem = carsListView.newCarButtonItem
    }

}

// MARK: - Actions
extension CarsListViewController {
    @objc func clickAddNewCar(sender: UIBarButtonItem) {
        print("создать новую машину")
    }
}

// MARK: - TableViewDataSource
extension CarsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        50
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "R\(indexPath.row)"
        cell?.imageView?.image = UIImage(systemName: "car")
        return cell ?? UITableViewCell()
    }
}

// MARK: - TableViewDelegate
extension CarsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
