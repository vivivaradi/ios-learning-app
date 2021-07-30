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
        
        switch self.dashboardService.packageType.value {
        case .refillItem:
            self.packageData = self.dashboardService.getRefillPackage()
                .map { package in
                    return DataPackageDetailsItemViewModel(package: package)
                }.asDriver(onErrorJustReturn: DataPackageDetailsItemViewModel())
        case .contentItem:
            self.packageData = self.dashboardService.getContentPackage()
                .map({ package in
                    return DataPackageDetailsItemViewModel(package: package)
                }).asDriver(onErrorJustReturn: DataPackageDetailsItemViewModel())
        default: packageData = Observable.empty().asDriver(onErrorJustReturn: DataPackageDetailsItemViewModel())
        }
    }
    
}
