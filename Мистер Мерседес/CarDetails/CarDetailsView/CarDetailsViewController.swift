//
//  CarDetailsViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 15.07.2022.
//

import UIKit
import CoreData

class CarDetailsViewController: UIViewController {
    
    struct Constants {
        static let cellID = "cellForCarsList"
    }
    
    let carDetailsView = CarDetailsView()
    var resultController: NSFetchedResultsController<Car>?

    override func loadView() {
        self.view = carDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        initNSFetchResultController()
        configureTableView()
    }
    
    func configureTableView() {
        carDetailsView.tableView.dataSource = self
        carDetailsView.tableView.delegate = self
        carDetailsView.tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constants.cellID
        )
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

extension CarDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID)
        cell?.textLabel?.text = "Месяц \(indexPath.row)"
        return cell ?? UITableViewCell()
    }
    
}

extension CarDetailsViewController: UITableViewDelegate {
    
}

extension CarDetailsViewController: NSFetchedResultsControllerDelegate {
    
}
