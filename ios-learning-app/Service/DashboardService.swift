//
//  DashboardService.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 28..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxRelay

protocol DashboardServiceType {
    
    var packageId: BehaviorRelay<String?> { get }
    var packageType: BehaviorRelay<DashboardItemViewModel?> { get }
}

class DashboardService: DashboardServiceType {
    var packageType: BehaviorRelay<DashboardItemViewModel?>
    
    var packageId: BehaviorRelay<String?>
    
    init() {
        self.packageId = BehaviorRelay<String?>(value: nil)
        self.packageType = BehaviorRelay<DashboardItemViewModel?>(value: nil)
    }
}
