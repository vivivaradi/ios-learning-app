//
//  DataPackageDetailsViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 29..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol DataPackageDetailsViewModelType {
    var packageData: Driver<DataPackageDetailsItemViewModel> { get }
}

class DataPackageDetailsViewModel: DataPackageDetailsViewModelType {
    
    var packageData: Driver<DataPackageDetailsItemViewModel>
        
    var dashboardInteractor: DashboardInteractorType!
    var dashboardService: DashboardServiceType!
    
    let bag = DisposeBag()
    
    init(dashboardInteractor: DashboardInteractorType, dashboardService: DashboardServiceType) {
        self.dashboardInteractor = dashboardInteractor
        self.dashboardService = dashboardService
        
        self.packageData = Observable.combineLatest(self.dashboardService.packageId, self.dashboardService.packageType)
            .map { id, type -> DataPackageDetailsItemViewModel in
                var item = DataPackageDetailsItemViewModel()
                switch type {
                case .mainItem:
                    print("nem ezt a kepernyot keresed")
                case .refillItem:
                    if let id = id {
                        dashboardInteractor.getRefillPackage(id: id)
                            .map { package in
                                let itemId = package.id ?? ""
                                let itemName = package.name ?? ""
                                let itemDescription = package.description ?? ""
                                let itemPrice = package.price ?? 0
                                item =  DataPackageDetailsItemViewModel(id: itemId, name: itemName, description: itemDescription, price: itemPrice)
                            }
                    }
                    
                case .contentItem:
                    if let id = id {
                        dashboardInteractor.getContentPackage(id: id)
                            .map { package in
                                let itemId = package.id ?? ""
                                let itemName = package.name ?? ""
                                let itemDescription = package.description ?? ""
                                let itemPrice = package.price ?? 0
                                item = DataPackageDetailsItemViewModel(id: itemId, name: itemName, description: itemDescription, price: itemPrice)
                            }
                    }
                    
                case .none:
                    print("nincs")
                }
                
                return item
            }.asDriver(onErrorJustReturn: DataPackageDetailsItemViewModel(id: "", name: "", description: "", price: 0))
    }
    
}
