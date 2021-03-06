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
    func postPurchase(id: String) -> Single<DataPurchaseResponse>
}

class DashboardInteractor: DashboardInteractorType {
    
    // MARK: - Public variables
    
    var dashboardDataResult: Observable<DashboardData>
    var dashboardRelay: PublishRelay<Void>
    
    // MARK: - Dependencies
    
    let networkManager: NetworkingManager!
    
    let bag = DisposeBag()
    
    // MARK: - Init
    
    init(networkManager: NetworkingManager) {
        self.networkManager = networkManager
        self.dashboardRelay = PublishRelay()
        self.dashboardDataResult = self.dashboardRelay
            .flatMapLatest({ _ -> Observable<DashboardData> in
                return networkManager.provider.rx.requestMapped(DashboardAPI.getDashboard)
            })
        self.dashboardDataResult.subscribe().disposed(by: bag)
    }
    
    // MARK: - Public methods
    
    func getRefillPackage(id: String) -> Single<RefillDataPackage> {
        let endpoint = DashboardAPI.getPackage(id: id)
        return self.networkManager.provider.rx.requestMappedSingle(endpoint)
    }
    
    func getContentPackage(id: String) -> Single<UnlimitedContentPackage> {
        let endpoint = DashboardAPI.getPackage(id: id)
        return self.networkManager.provider.rx.requestMappedSingle(endpoint)
    }
    
    func postPurchase(id: String) -> Single<DataPurchaseResponse> {
        let endpoint = DashboardAPI.postPurchase(id: id)
        return self.networkManager.provider.rx.requestMappedSingle(endpoint)
    }
}
