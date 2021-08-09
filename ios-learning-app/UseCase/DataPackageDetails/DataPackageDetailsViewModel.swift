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
    
    func storePackageName(name: String)
}

class DataPackageDetailsViewModel: DataPackageDetailsViewModelType {
    
    // MARK: - Public variables
    
    var packageData: Driver<DataPackageDetailsItemViewModel>
        
    // MARK: - Dependencies
    
    var dashboardInteractor: DashboardInteractorType!
    var dashboardService: DashboardServiceType!
    
    // MARK: - Init
    
    init(dashboardInteractor: DashboardInteractorType, dashboardService: DashboardServiceType) {
        self.dashboardInteractor = dashboardInteractor
        self.dashboardService = dashboardService
        
        switch self.dashboardService.packageType.value {
        case .refillItem:
            self.packageData = self.dashboardService.getRefillPackage()
                .map { package in
                    return DataPackageDetailsItemViewModel(package: package)
                }.asDriver(onErrorJustReturn: DataPackageDetailsItemViewModel())
                .startWith(DataPackageDetailsItemViewModel())
        case .contentItem:
            self.packageData = self.dashboardService.getContentPackage()
                .map({ package in
                    return DataPackageDetailsItemViewModel(package: package)
                }).asDriver(onErrorJustReturn: DataPackageDetailsItemViewModel())
                .startWith(DataPackageDetailsItemViewModel())
        default: packageData = Observable.empty().asDriver(onErrorJustReturn: DataPackageDetailsItemViewModel())
        }
    }
    
    // MARK: - Public methods
    
    func storePackageName(name: String) {
        self.dashboardService.packageName.accept(name)
    }
}
