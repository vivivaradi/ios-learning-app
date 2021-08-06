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
    
    func selectedItem(with id: String, type: DashboardItemViewModel)
    func deselectedItem()

}

class DashboardViewModel: DashboardViewModelType {
    
    // MARK: - Public variables
    
    var dashboardData: Driver<[DashboardSectionViewModel]>
    var dashboardRelay: PublishRelay<Void> {
        return dashboardInteractor.dashboardRelay
    }
    
    // MARK: - Dependencies
    
    var dashboardInteractor: DashboardInteractorType!
    var dashboardService: DashboardServiceType!
    
    // MARK: - Init
    
    init(dashboardInteractor: DashboardInteractorType, dashboardService: DashboardServiceType) {
        self.dashboardInteractor = dashboardInteractor
        self.dashboardService = dashboardService
        
        self.dashboardData = self.dashboardInteractor.dashboardDataResult
            .map({ data -> [DashboardSectionViewModel] in
                var dashboardSections: [DashboardSectionViewModel] = []
                
                guard let currentData = data.postpaid?.pools?[0] else {
                    return []
                }
                
                let mainData = CurrentDataCellItemViewModel(package: currentData)
                let mainItem = DashboardItemViewModel.mainItem(item: mainData)
                let mainSection = DashboardSectionViewModel.mainSection(item: mainItem)

                dashboardSections.append(mainSection)
                
                var refillItems: [DashboardItemViewModel] = []
                
                guard let refills = data.postpaid?.refills else {
                    return []
                }
                
                for refill in refills {
                    let item = DashboardItemViewModel.refillItem(item: RefillDataCellItemViewModel(package: refill))
                    refillItems.append(item)
                    
                }
                
                dashboardSections.append(DashboardSectionViewModel.refillSection(title: Constants.refillHeaderString, items: refillItems))
                
                var contentPackageItems: [DashboardItemViewModel] = []
                
                guard let contentPackages = data.postpaid?.unlimitedContentPackages else {
                    return []
                }
                
                for package in contentPackages {
                    let item = DashboardItemViewModel.contentItem(item: RefillDataCellItemViewModel(package: package))
                    contentPackageItems.append(item)
                    
                }
                
                dashboardSections.append(DashboardSectionViewModel.contentSection(title: Constants.contentHeaderString, items: contentPackageItems))
                
                return dashboardSections
                
            }).startWith([])
            .asDriver(onErrorDriveWith: Driver.just([]))
    }
    
    // MARK: - Public methods
    
    func selectedItem(with id: String, type: DashboardItemViewModel) {
        self.dashboardService.packageId.accept(id)
        self.dashboardService.packageType.accept(type)
    }
    
    func deselectedItem() {
        self.dashboardService.packageId.accept(nil)
        self.dashboardService.packageType.accept(nil)
    }
    
}
