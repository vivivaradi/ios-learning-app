//
//  DashboardInteractor.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxSwift

protocol DashboardInteractorType {
    func getData() -> Single<DashboardData>
}

class DashboardInteractor: DashboardInteractorType {
    
    let networkManager: NetworkingManager!
    
    init(networkManager: NetworkingManager) {
        self.networkManager = networkManager
    }
    
    func getData() -> Single<DashboardData> {
    }
    
    
}
