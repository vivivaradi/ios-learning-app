//
//  DashboardService.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 28..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

protocol DashboardServiceType {
  
    var packageId: BehaviorRelay<String?> { get }
    var packageType: BehaviorRelay<DashboardItemViewModel?> { get }
    
    func getRefillPackage() -> Single<RefillDataPackage>
    func getContentPackage() -> Single<UnlimitedContentPackage>
}

class DashboardService: DashboardServiceType {
    
    var packageType: BehaviorRelay<DashboardItemViewModel?>
    var packageId: BehaviorRelay<String?>
    
    var dashboardInteractor: DashboardInteractorType!
    
    init(dashboardInteractor: DashboardInteractorType) {
        self.packageId = BehaviorRelay<String?>(value: nil)
        self.packageType = BehaviorRelay<DashboardItemViewModel?>(value: nil)
        self.dashboardInteractor = dashboardInteractor
    }
    
    func getRefillPackage() -> Single<RefillDataPackage> {
        let id = packageId.value ?? ""
        return self.dashboardInteractor.getRefillPackage(id: id)
    }
    
    func getContentPackage() -> Single<UnlimitedContentPackage> {
        let id = packageId.value ?? ""
        return self.dashboardInteractor.getContentPackage(id: id)
    }
}
