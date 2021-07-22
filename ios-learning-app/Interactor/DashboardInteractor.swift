//
//  DashboardInteractor.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

protocol DashboardInteractorType {
    
    var dashboardDataRelay: PublishRelay<DashboardData> { get }
    var dashboardDataResult: Observable<DashboardData> { get }

}

class DashboardInteractor: DashboardInteractorType {
    
    var dashboardDataResult: Observable<DashboardData>
    var dashboardDataRelay: PublishRelay<DashboardData>
    
    let networkManager: NetworkingManager!
    
    let bag = DisposeBag()
    
    init(networkManager: NetworkingManager) {
        self.networkManager = networkManager
        self.dashboardDataRelay = PublishRelay()
        self.dashboardDataResult = self.dashboardDataRelay
            .flatMapLatest({ data -> Observable<DashboardData> in
                return self.networkManager.provider.rx.request(DashboardAPI.getData).asObservable()
            })
    }
    
}
