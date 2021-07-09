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
    
    var myPackage = CurrentDataPackage(name: "Osztható Adat 20 GB", totalData: 20480, usedData: 14782, expirationDate: Date())
    
    var refillPackages = [
        RefillDataPackage(name: "Osztható PluszAdat 300MB", price: 750),
        RefillDataPackage(name: "Osztható PluszAdat 1GB", price: 1800)
    ]
    
    var dataPackages = [
        RefillDataPackage(name: "Navigate Pass", price: 1000),
        RefillDataPackage(name: "Music Pass", price: 1000)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        
        setupTableView()
    }
    
    private func setupStyle() {
        
    }
    
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.register(UINib(nibName: Constants.refillDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.refillDataCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.currentDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.currentDataCellIdentifier)
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refillPackages.count
    }
    
    fileprivate func configureCell(_ tableView: UITableView, _ indexPath: IndexPath, _ package: RefillDataPackage, identifier: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.refillDataCellIdentifier, for: indexPath) as! RefillDataCell
        cell.configure(from: package)
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch (indexPath.section) {
        case 0: {
            let package = myPackage
            cell = configureCell(tableView, indexPath, <#T##package: RefillDataPackage##RefillDataPackage#>, identifier: <#T##String#>)
        }
        let package = refillPackages[indexPath.row]
        return configureCell(tableView, indexPath, package, identifier: <#String#>)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
