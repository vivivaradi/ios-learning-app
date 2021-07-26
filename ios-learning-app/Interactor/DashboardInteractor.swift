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
            .flatMapLatest({ _ -> Observable<DashboardData> in
                return networkManager.provider.rx.requestMapped(DashboardAPI.getData)
            })
        self.dashboardDataResult.subscribe().disposed(by: bag)
    }
    
}