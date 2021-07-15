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
 
    var sections = [
        SectionData(title: "", data: [
            CurrentDataPackage(name: "Osztható Adat 20 GB", totalData: 20480, usedData: 14782, expirationDate: Date())]),
        SectionData(title: "Refills", data: [
            RefillDataPackage(name: "Osztható PluszAdat 300MB", price: 750),
            RefillDataPackage(name: "Osztható PluszAdat 1GB", price: 1800)
        ]),
        SectionData(title: "Unlimited Content Packages", data: [
            RefillDataPackage(name: "Navigate Pass", price: 1000),
            RefillDataPackage(name: "Music Pass", price: 1000)
        ])
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
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: Constants.refillDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.refillDataCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.currentDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.currentDataCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.sectionHeaderCellNibName, bundle: nil), forCellReuseIdentifier: Constants.sectionHeaderCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.dashboardHeaderCellNibName, bundle: nil), forCellReuseIdentifier: Constants.dashboardHeaderCellIdentifier)
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = sections[section].itemCount
        return count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if (indexPath.section == 0) {
            let cellData = sections[indexPath.section].data[indexPath.row] as! CurrentDataPackage
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.currentDataCellIdentifier, for: indexPath) as! CurrentDataCell
            cell.configure(from: cellData)
            return cell
        } else {
            let cellData = sections[indexPath.section].data[indexPath.row] as! RefillDataPackage
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.refillDataCellIdentifier, for: indexPath) as! RefillDataCell
            cell.configure(from: cellData)
            return cell
        }
            
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    

}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            let view = tableView.dequeueReusableCell(withIdentifier: Constants.dashboardHeaderCellIdentifier) as! DashboardHeaderCell
            view.configure()
            return view
        } else {
            let headerTitle = sections[section].title
            let view = tableView.dequeueReusableCell(withIdentifier: Constants.sectionHeaderCellIdentifier) as! SectionHeaderCell
            view.configure(with: headerTitle)
            return view
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
}

