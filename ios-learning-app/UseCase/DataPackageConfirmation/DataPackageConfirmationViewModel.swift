//
//  DataPackageConfirmationViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 08. 02..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxCocoa

protocol DataPackageConfirmationViewModelType {
    var packageData: Driver<String?> { get }
}

class DataPackageConfirmationViewModel: DataPackageConfirmationViewModelType {
    
    var packageData: Driver<String?>
    
    var dashboardService: DashboardServiceType!
    
    init(dashboardService: DashboardServiceType) {
        self.dashboardService = dashboardService
        
        self.packageData = self.dashboardService.packageName.asDriver()
    }
}
