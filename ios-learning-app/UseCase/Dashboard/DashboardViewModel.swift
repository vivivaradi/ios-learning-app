//
//  DashboardViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 28..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol DashboardViewModelType {
    var dashboardData: Driver<[DashboardSectionViewModel]> { get }
    var dashboardRelay: PublishRelay<Void> { get }
}

class DashboardViewModel: DashboardViewModelType {
    
    var dashboardInteractor: DashboardInteractorType!
    var dashboardData: Driver<[DashboardSectionViewModel]>
    var dashboardRelay: PublishRelay<Void> {
        return dashboardInteractor.dashboardRelay
    }
    
    init(dashboardInteractor: DashboardInteractorType) {
        self.dashboardInteractor = dashboardInteractor
        
        self.dashboardData = self.dashboardInteractor.dashboardDataResult
            .map({ data -> [DashboardSectionViewModel] in
                var dashboardSections: [DashboardSectionViewModel] = []
                
                guard let currentData = data.postpaid?.pools?[0] else {
                    return []
                }
                
                let id = currentData.id ?? ""
                let name = currentData.name ?? ""
                let totalData = currentData.total ?? 0
                let usedData = currentData.actualUsage ?? 0
                let dateString = currentData.expirationDate ?? ""
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                let endDate = formatter.date(from: dateString) ?? Date()
                let days = RemainingTime.getDays(until: endDate)
                
                let mainData = CurrentDataCellItemViewModel(id: id, name: name, totalData: totalData, usedData: usedData, daysLeft: days)
                let mainItem = DashboardItemViewModel.mainItem(item: mainData)
                let mainSection = DashboardSectionViewModel.mainSection(item: mainItem)

                dashboardSections.append(mainSection)
                
                var refillItems: [DashboardItemViewModel] = []
                
                guard let refills = data.postpaid?.refills else {
                    return []
                }
                
                for refill in refills {
                    let id = refill.id ?? ""
                    let name = refill.name ?? ""
                    let price = refill.price ?? 0
                    let item = DashboardItemViewModel.refillItem(item: RefillDataCellItemViewModel(id: id, name: name, price: price))
                    refillItems.append(item)
                    
                }
                
                dashboardSections.append(DashboardSectionViewModel.refillSection(title: Constants.refillHeaderString, items: refillItems))
                
                var contentPackageItems: [DashboardItemViewModel] = []
                
                guard let contentPackages = data.postpaid?.unlimitedContentPackages else {
                    return []
                }
                
                for package in contentPackages {
                    let id = package.id ?? ""
                    let name = package.name ?? ""
                    let price = package.price ?? 0
                    let item = DashboardItemViewModel.refillItem(item: RefillDataCellItemViewModel(id: id, name: name, price: price))
                    contentPackageItems.append(item)
                    
                }
                
                dashboardSections.append(DashboardSectionViewModel.contentSection(title: Constants.contentHeaderString, items: contentPackageItems))
                
                return dashboardSections
                
            }).startWith([])
            .asDriver(onErrorDriveWith: Driver.just([]))
    }
}
