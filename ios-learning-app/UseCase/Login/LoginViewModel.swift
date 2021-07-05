//
//  LoginViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 22..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Swinject
import Moya

protocol LoginViewModelType {
    
    func performLogin(msisdn: String)
    func hasActiveSession() -> Bool
}

class LoginViewModel: LoginViewModelType {
    
    var sessionManager: SessioningManager!
    var networkManager: NetworkingManager!
    
    init(sessionManager: SessioningManager,
         networkManager: NetworkingManager) {
        self.sessionManager = sessionManager
        self.networkManager = networkManager
    }
    
    func performLogin(msisdn: String) {
       networkManager.provider.request(MultiTarget(LoginAPI.loginUser(msisdn: msisdn))) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let successfulResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try successfulResponse.map(LoginResponse.self)
                    self.sessionManager.startSession(token: data.accessToken, telnum: msisdn)
                    
                } catch let error {
                    print(error)
                    
                }

            case let .failure(error):
                print(error)
                
            }
        }
    }
    
    func hasActiveSession() -> Bool {
        return sessionManager.isSessionActive()
    }
}
