//
//  LoginViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 22..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Swinject

protocol LoginViewModelType {
    var sessionManager: SessioningManager { get }
    var networkManager: NetworkingManager { get }
    
    func performLogin(msisdn: String)
}

class LoginViewModel: LoginViewModelType {
    
    var sessionManager: SessioningManager
    var networkManager: NetworkingManager
    
    init() {
    }
    
    func performLogin(msisdn: String, password: String) -> Bool {
       networkManager.provider.request(MultiTarget(LoginAPI.loginUser(msisdn: msisdn))) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let successfulResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try successfulResponse.map(LoginResponse.self)
                    self.sessionManager.startSession(token: data.accessToken, telnum: msisdn)
                    return true
                } catch let error {
                    print(error)
                    return false
                }

            case let .failure(error):
                print(error)
                return false
            }
        }
    }
}
