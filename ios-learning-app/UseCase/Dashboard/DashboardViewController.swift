//
//  DashboardViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 08..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    
    var viewModel: DashboardViewModelType!
    
    @IBOutlet weak var tableView: UITableView!
    
    var packages = [
        RefillDataPackage(name: "Osztható PluszAdat 300MB", price: 750),
        RefillDataPackage(name: "Osztható PluszAdat 1GB", price: 1800)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        
        setupTableView()
    }
    
    private func setupStyle() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: Constants.refillDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.refillDataCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.currentDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.currentDataCellIdentifier)
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let package = packages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.refillDataCellIdentifier, for: indexPath) as! RefillDataCell
        cell.configure(price: package.price, name: package.name)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
