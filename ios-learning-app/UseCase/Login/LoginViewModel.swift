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
import RxSwift
import RxCocoa

protocol LoginViewModelType {
    
    var msisdnValue: BehaviorRelay<String?> {get}
    var passwordValue: BehaviorRelay<String?> {get}
    var fieldsAreValid: Observable<Bool> {get}
    
    func performLogin(msisdn: String, completion: @escaping ((LoginViewState) -> Void))
    func hasActiveSession() -> Bool
}

class LoginViewModel: LoginViewModelType {
    
    var msisdnValue: BehaviorRelay<String?>
    var passwordValue: BehaviorRelay<String?>
    
    var fieldsAreValid: Observable<Bool> {
        return Observable.combineLatest(msisdnValue, passwordValue) { msisdn, password in
            guard msisdn != nil && password != nil else {
                return false
            }
            return msisdn!.isMsisdnValid() && password!.isPasswordValid()
        }
    }
    
    
    var sessionManager: SessioningManager!
    var networkManager: NetworkingManager!
    
    init(sessionManager: SessioningManager,
         networkManager: NetworkingManager) {
        self.sessionManager = sessionManager
        self.networkManager = networkManager
        self.msisdnValue = BehaviorRelay<String?>(value: "")
        self.passwordValue = BehaviorRelay<String?>(value: "")
    }
    
    func performLogin(msisdn: String, completion: @escaping ((LoginViewState) -> Void)) {
        self.networkManager.provider.request(MultiTarget(LoginAPI.loginUser(msisdn: msisdn))) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let successfulResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try successfulResponse.map(LoginResponse.self)
                    self.sessionManager.startSession(token: data.accessToken, telnum: msisdn)
                    completion(.success)
                    
                } catch let error {
                    print(error)
                    completion(.failure)
                }

            case let .failure(error):
                print(error)
                completion(.failure)
            }
        }
    }
    
    func hasActiveSession() -> Bool {
        return self.sessionManager.isSessionActive()
    }
}
