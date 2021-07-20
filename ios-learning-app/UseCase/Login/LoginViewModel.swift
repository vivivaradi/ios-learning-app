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
    
    func performLogin(msisdn: String) -> Single<LoginResponse>
    func hasActiveSession() -> Bool
}

class LoginViewModel: LoginViewModelType {    
    
    var sessionManager: SessioningManager!
    var loginInteractor: LoginInteractorType!
    
    init(sessionManager: SessioningManager, loginInteractor: LoginInteractorType) {
        self.sessionManager = sessionManager
        self.loginInteractor = loginInteractor
    }
    
    func performLogin(msisdn: String) -> Single<LoginResponse>{
        return self.loginInteractor.login(msisdn: msisdn)
    }
    
    func hasActiveSession() -> Bool {
        return self.sessionManager.isSessionActive()
    }
}
