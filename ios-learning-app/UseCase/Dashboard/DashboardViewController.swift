//
//  DashboardViewController.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 08..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources
import RxSwift

class DashboardViewController: UIViewController {
    
    var viewModel: DashboardViewModelType!
    
    var dataSource: RxTableViewSectionedReloadDataSource<DashboardSectionViewModel>!
    
    let bag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupStyle()
        self.configureTableView()
        self.configureDataSource()
        
        self.viewModel.dashboardData
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    
    private func setupStyle() {
        
    }
    
}

extension DashboardViewController {
    func configureTableView() {
        self.tableView.rx.setDelegate(self)
            .disposed(by: bag)
        
        self.tableView.register(UINib(nibName: Constants.refillDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.refillDataCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.currentDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.currentDataCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.sectionHeaderCellNibName, bundle: nil), forCellReuseIdentifier: Constants.sectionHeaderCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.dashboardHeaderCellNibName, bundle: nil), forCellReuseIdentifier: Constants.dashboardHeaderCellIdentifier)
    }
    
    func configureDataSource() {
        dataSource = RxTableViewSectionedReloadDataSource<DashboardSectionViewModel>(configureCell: { [weak self] (dataSource, table, indexPath, model) in
            switch model {
            case .mainItem(let item):
                if let cell = table.dequeueReusableCell(withIdentifier: Constants.currentDataCellIdentifier, for: indexPath) as? CurrentDataCell {
                    cell.configure(from: item)
                    return cell
                }
                return UITableViewCell()
                
            case .refillItem(let item):
                if let cell = table.dequeueReusableCell(withIdentifier: Constants.refillDataCellIdentifier, for: indexPath) as? RefillDataCell {
                    cell.configure(from: item)
                    return cell
                }
                return UITableViewCell()
            }
        })
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
        switch dataSource[section] {
        case .mainSection(_):
            if let mainHeaderCell = tableView.dequeueReusableCell(withIdentifier: Constants.dashboardHeaderCellIdentifier) as? DashboardHeaderCell {
                return mainHeaderCell
            }
            return nil
        case .refillSection(let title, _):
            if let sectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: Constants.sectionHeaderCellIdentifier) as? SectionHeaderCell {
                sectionHeaderCell.configure(with: title)
                return sectionHeaderCell
            }
            return nil
        case .contentSection(let title, _):
            if let sectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: Constants.sectionHeaderCellIdentifier) as? SectionHeaderCell {
                sectionHeaderCell.configure(with: title)
                return sectionHeaderCell
            }
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
}
