//
//  DataPackageResultViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 08. 04..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxCocoa

protocol DataPackageResultViewModelType {
    var result: Driver<DataPackageResultItemViewModel> { get }
}

class DataPackageResultViewModel: DataPackageResultViewModelType {
    
    // MARK: - Public variables
    
    var result: Driver<DataPackageResultItemViewModel>
    
    //MARK: - Dependencies
    
    var dashboardService: DashboardServiceType!
    
    // MARK: - Init
    
    init(dashboardService: DashboardServiceType) {
        self.dashboardService = dashboardService
        self.result = self.dashboardService.postPurchase()
            .map({ response in
                return DataPackageResultItemViewModel(dataPurchaseResponse: response)
            }).asDriver(onErrorJustReturn: DataPackageResultItemViewModel())
            
    }
}
