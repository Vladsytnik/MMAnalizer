//
//  ViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 05.07.2022.
//

import UIKit
import CoreData

class CarsListViewController: UIViewController {
    
    struct Constant {
        static let cellID = "cellForCarsList"
    }

    let viewModel: CarsListViewModel
    let carsListView = CarsListView()
    var resultController: NSFetchedResultsController<Car>?
    
    // MARK: - init
    init(viewModel: CarsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        initNSFetchResultController()
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
        carsListView.tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constant.cellID
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
    
    func initNSFetchResultController() {
        resultController = Car.resultController
        resultController?.delegate = self
        do {
            try resultController?.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
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
        guard let sections = resultController?.sections else {return 0}
        return sections[section].numberOfObjects
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let car = resultController?.object(at: indexPath) else { return UITableViewCell() }
        
        let cell = tableView
            .dequeueReusableCell(withIdentifier: Constant.cellID)
        cell?.textLabel?.text = car.name
        cell?.imageView?.image = UIImage(systemName: "car")
        return cell ?? UITableViewCell()
    }
}

// MARK: - Delegates
extension CarsListViewController: UITableViewDelegate, NSFetchedResultsControllerDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
//            viewModel.deleteCar.onNext(indexPath)
            Car.deleteCar(withIndexPath: indexPath)
        case .none:
            return
        case .insert:
            return
        @unknown default:
            return
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        carsListView.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        guard let indexPath = indexPath else {return}
        
        switch type {
        case .insert:
            print("вставка")
        case .delete:
            carsListView.tableView.deleteRows(at: [indexPath], with: .automatic)
        case .move:
            break
        case .update:
            break
        @unknown default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        carsListView.tableView.endUpdates()
    }
}
