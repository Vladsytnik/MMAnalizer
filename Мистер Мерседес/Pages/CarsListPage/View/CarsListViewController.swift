//
//  ViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit

class CarsListViewController: UIViewController {
    
    struct Constants {
        static let cellID = "cellForCarsList"
        static let heightForRow: CGFloat = 50
    }

    let viewModel: CarsListViewModel
    var carsListView = CarsListView()
    var cars: [Car] = []
    
    // MARK: - init
    init(viewModel: CarsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    
        cars = CarDataManager.shared.getEntities()
        configureTableView()
        CarDataManager.shared.delegate = self
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
        carsListView.tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constants.cellID
        )
    }
    
    func configureThisVC() {
        self.view.backgroundColor = .white
        self.title = "Автомобили"
        self.navigationItem.backButtonTitle = "Назад"
    }
    
    func configureRightBarButtonItem() {
        carsListView.newCarButtonItem.target = self
        carsListView.newCarButtonItem.action = #selector(clickAddNewCar)
        self.navigationItem
            .rightBarButtonItem = carsListView.newCarButtonItem
    }
    
    func checkCarsCount() {
        carsListView.emptyCarsListLabel.rx.isHidden.onNext(
            cars.count != 0
        )
    }
}

// MARK: - Actions
extension CarsListViewController {
    @objc func clickAddNewCar(sender: UIBarButtonItem) {
        let controller = NewCarPageViewController()
        navigationController?
            .pushViewController(controller, animated: true)
    }
}

// MARK: - DataSource
extension CarsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        checkCarsCount()
        return cars.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = cars[indexPath.row]
        
        let cell = tableView
            .dequeueReusableCell(withIdentifier: Constants.cellID)
        cell?.textLabel?.text = car.name
        cell?.imageView?.image = UIImage(systemName: "car")
        return cell ?? UITableViewCell()
    }
}

// MARK: - TableView Delegate
extension CarsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.heightForRow
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            CarDataManager.shared.deleteCar(from: &cars, withIndexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .none:
            return
        case .insert:
            return
        @unknown default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = CarDetailsViewController()
        viewController.title = cars[indexPath.row].name
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CarDataDelegate
extension CarsListViewController: CarDataDelegate {
    func insertCar(indexPath: IndexPath) {
        cars = CarDataManager.shared.getEntities()
        carsListView.tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
