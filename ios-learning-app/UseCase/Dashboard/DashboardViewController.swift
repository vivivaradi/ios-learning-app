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
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: DashboardViewModelType!
    
    var packages = [
        RefillDataPackage(name: "Osztható PluszAdat 300MB", price: 750),
        RefillDataPackage(name: "Osztható PluszAdat 1GB", price: 1800)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: Constants.dataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.dataCellIdentifier)
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let package = packages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.dataCellIdentifier, for: indexPath) as! RefillDataCell
        cell.dataLabel.text = package.name
        cell.priceLabel.text = "\(package.price) Ft"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
