//
//  LoginInteractor.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 20..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginInteractorType {
    func login(msisdn: String) -> Single<LoginResponse>
}

class LoginInteractor: LoginInteractorType {
    
    // MARK: - Dependencies
    
    let networkManager: NetworkingManager!
    
    // MARK: - Init
    
    init(networkManager: NetworkingManager) {
        self.networkManager = networkManager
    }
    
    // MARK: - Public methods
    
    func login(msisdn: String) -> Single<LoginResponse> {
        let endpoint = LoginAPI.loginUser(msisdn: msisdn)
        return self.networkManager.provider.rx.requestMappedSingle(endpoint)
    }
}
