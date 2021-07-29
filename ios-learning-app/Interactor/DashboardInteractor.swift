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
    
    var dashboardRelay: PublishRelay<Void> { get }
    var dashboardDataResult: Observable<DashboardData> { get }

    func getRefillPackage(id: String) -> Single<RefillDataPackage>
    func getContentPackage(id: String) -> Single<UnlimitedContentPackage>
}

class DashboardInteractor: DashboardInteractorType {
    
    var dashboardDataResult: Observable<DashboardData>
    var dashboardRelay: PublishRelay<Void>
    
    let networkManager: NetworkingManager!
    
    let bag = DisposeBag()
    
    init(networkManager: NetworkingManager) {
        self.networkManager = networkManager
        self.dashboardRelay = PublishRelay()
        self.dashboardDataResult = self.dashboardRelay
            .flatMapLatest({ _ -> Observable<DashboardData> in
                return networkManager.provider.rx.requestMapped(DashboardAPI.getDashboard)
            })
        self.dashboardDataResult.subscribe().disposed(by: bag)
    }
    
    func getRefillPackage(id: String) -> Single<RefillDataPackage> {
        let endpoint = DashboardAPI.getPackage(id: id)
        return self.networkManager.provider.rx.requestMappedSingle(endpoint)
    }
    
    func getContentPackage(id: String) -> Single<UnlimitedContentPackage> {
        let endpoint = DashboardAPI.getPackage(id: id)
        return self.networkManager.provider.rx.requestMappedSingle(endpoint)
    }
    
}
