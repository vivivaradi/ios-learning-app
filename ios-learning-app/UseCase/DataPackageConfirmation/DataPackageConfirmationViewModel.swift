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
    
    // MARK: - Public variables
    
    var packageData: Driver<String?>
    
    // MARK: - Dependencies
    
    var dashboardService: DashboardServiceType!
    
    // MARK: - Init
    
    init(dashboardService: DashboardServiceType) {
        self.dashboardService = dashboardService
        
        self.packageData = self.dashboardService.packageName.asDriver()
    }
}
