//
//  NewCarPageViewController.swift
//  Мистер Мерседес
//
//  Created by Vlad Sytnik on 07.07.2022.
//

import UIKit

class NewCarPageViewController: UIViewController {
    
    var newCarPageView = NewCarPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureThisVC()
    }
    
    override func loadView() {
        view = newCarPageView
    }
    
    func configureThisVC() {
        self.view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Добавить новый"
        
    }

}
