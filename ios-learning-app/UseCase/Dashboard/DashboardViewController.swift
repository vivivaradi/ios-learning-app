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
    
    var pullToRefresh: UIRefreshControl = UIRefreshControl()
    
    let bag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.configureDataSource()
        self.configurePullToRefresh()
        
        self.viewModel.dashboardData
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        
        self.viewModel.dashboardRelay.accept(Void())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupStyle() {
        
    }
    
    func navigateTo(storyboard name: String, withIdentifier id: String) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: id) as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: UITableView configuration

extension DashboardViewController {
    func configureTableView() {
        self.tableView.refreshControl = self.pullToRefresh
        
        self.tableView.rx.setDelegate(self)
            .disposed(by: bag)
        
        self.tableView.register(UINib(nibName: Constants.refillDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.refillDataCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.currentDataCellNibName, bundle: nil), forCellReuseIdentifier: Constants.currentDataCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.sectionHeaderCellNibName, bundle: nil), forCellReuseIdentifier: Constants.sectionHeaderCellIdentifier)
        self.tableView.register(UINib(nibName: Constants.dashboardHeaderCellNibName, bundle: nil), forCellReuseIdentifier: Constants.dashboardHeaderCellIdentifier)
        
        self.tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                switch self.dataSource[indexPath] {
                case .mainItem(let item):
                    print(item)
                case .refillItem(let item), .contentItem(let item):
                    self.viewModel.selectedItem(with: item.id, type: self.dataSource[indexPath])
                }
                self.navigateTo(storyboard: "Dashboard", withIdentifier: "DataPackageDetailsViewController")
            }).disposed(by: bag)
    }
    
    func configureDataSource() {
        dataSource = RxTableViewSectionedReloadDataSource<DashboardSectionViewModel>(configureCell: { [weak self] (_, table, indexPath, model) in
            switch model {
            case .mainItem(let item):
                if let cell = table.dequeueReusableCell(withIdentifier: Constants.currentDataCellIdentifier, for: indexPath) as? CurrentDataCell {
                    cell.setupData(from: item)
                    return cell
                }
                return UITableViewCell()
                
            case .refillItem(let item), .contentItem(let item):
                if let cell = table.dequeueReusableCell(withIdentifier: Constants.refillDataCellIdentifier, for: indexPath) as? RefillDataCell {
                    cell.setupData(from: item)
                    return cell
                }
                return UITableViewCell()
            }
        })
    }
    
}

// MARK: Pull to Refresh configuration

extension DashboardViewController {
    func configurePullToRefresh() {
        self.pullToRefresh.rx
            .controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.dashboardRelay.accept(Void())
            }).disposed(by: bag)
        
        self.viewModel.dashboardData
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.pullToRefresh.endRefreshing()
            }).disposed(by: bag)

    }
}

// MARK: UITableView delegates

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
                mainHeaderCell.setupData()
                return mainHeaderCell
            }
            return nil
        case .refillSection(let title, _):
            if let sectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: Constants.sectionHeaderCellIdentifier) as? SectionHeaderCell {
                sectionHeaderCell.setupData(with: title)
                return sectionHeaderCell
            }
            return nil
        case .contentSection(let title, _):
            if let sectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: Constants.sectionHeaderCellIdentifier) as? SectionHeaderCell {
                sectionHeaderCell.setupData(with: title)
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
