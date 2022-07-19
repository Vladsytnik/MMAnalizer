//
//  SalesViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 16.07.2022.
//

import UIKit

class SalesViewController: UIViewController {
    
    let viewModel: SalesViewModel
    let salesView = SalesView()

    init(viewModel: SalesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
}
