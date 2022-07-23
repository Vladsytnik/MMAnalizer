//
//  CustomSearchTextField.swift
//  CustomSearchField
//
//  Created by Emrick Sinitambirivoutin on 19/02/2019.
//  Copyright © 2019 Emrick Sinitambirivoutin. All rights reserved.
//

import UIKit
import CoreData
import SnapKit

class CustomSearchTextField: UITextField {
    
    var dataList: [Car] = []
    var resultsList: [Car]?
    var tableView: UITableView?
    
    let context = CarDataManager.shared.context
    
    // Connecting the new element to the parent view
    open override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        tableView?.removeFromSuperview()
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        self.addTarget(self, action: #selector(CustomSearchTextField.textFieldDidChange), for: .editingChanged)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        buildSearchTableView()
        resultsList = dataList
    }
    
    func buildSearchTableView() {
        if let tableView = tableView {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomSearchTextFieldCell")
            tableView.delegate = self
            tableView.dataSource = self
            self.window?.addSubview(tableView)

        } else {
            // addData()
            print("tableView created")
            tableView = UITableView(frame: CGRect.zero)
        }
        
        updateSearchTableView()
    }
     
    //////////////////////////////////////////////////////////////////////////////
    // Text Field related methods
    //////////////////////////////////////////////////////////////////////////////
    
    @objc open func textFieldDidChange() {
        filter()
        updateSearchTableView()
        tableView?.isHidden = false
    }
    
    //////////////////////////////////////////////////////////////////////////////
    // Data Handling methods
    //////////////////////////////////////////////////////////////////////////////
    
    // MARK: CoreData manipulation methods
    
    // Don't need this function in this case
    func saveItems() {
        print("Saving items")
        do {
            try context.save()
        } catch {
            print("Error while saving items: \(error)")
        }
    }
    
    func loadItems() {
        dataList = CarDataManager.shared.getEntities()
    }
    
    // MARK: Filtering methods
    
    fileprivate func filter() {
//        let predicate = NSPredicate(format: "cityName CONTAINS[cd] %@", self.text!)
//        let request : NSFetchRequest<Cities> = Cities.fetchRequest()
//        request.predicate = predicate

        loadItems()
        
        tableView?.reloadData()
    }
    
}

extension CustomSearchTextField: UITableViewDelegate, UITableViewDataSource {
    
    //////////////////////////////////////////////////////////////////////////////
    // Table View related methods
    //////////////////////////////////////////////////////////////////////////////
    
    // MARK: TableView creation and updating
    // Create SearchTableview
    
    // Updating SearchtableView
    func updateSearchTableView() {
        
        if let tableView = tableView {
            superview?.bringSubviewToFront(tableView)
//            var tableHeight: CGFloat = 0
//            tableHeight = tableView.contentSize.height
//
//            // Set a bottom margin of 10p
//            if tableHeight < tableView.contentSize.height {
//                tableHeight -= 10
//            }
            
//             Set tableView frame
            var tableViewFrame = CGRect(x: 0, y: 0, width: frame.size.width - 4, height: 80)
            tableViewFrame.origin = self.convert(tableViewFrame.origin, to: nil)
            tableViewFrame.origin.x += 2
            tableViewFrame.origin.y += frame.size.height + 2
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.tableView?.frame = tableViewFrame
            })
            
//            tableView.translatesAutoresizingMaskIntoConstraints = false
////
//            tableView.snp.makeConstraints { make in
//                make.width.equalTo(frame.size.width - 4)
//                make.height.equalTo(100)
//                make.leading.equalTo(self)
//                make.top.equalTo(self)
//            }
            
            // Setting tableView style
            tableView.layer.masksToBounds = true
            tableView.separatorInset = UIEdgeInsets.zero
            tableView.layer.cornerRadius = 5.0
            tableView.separatorColor = UIColor.lightGray
            tableView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
            
            if self.isFirstResponder {
                superview?.bringSubviewToFront(self)
            }
            
            tableView.reloadData()
        }
    }
    
    // MARK: TableViewDataSource methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsList!.count
    }
    
    // MARK: TableViewDelegate methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSearchTextFieldCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.clear
//        cell.textLabel?.text = resultsList?[indexPath.row].name
        cell.textLabel?.text = "test"
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row")
        self.text = resultsList?[indexPath.row].name
        tableView.isHidden = true
        self.endEditing(true)
    }
}
