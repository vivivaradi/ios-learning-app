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
}

class LoginViewModel: LoginViewModelType {    
    
    // MARK: - Dependencies

    var loginInteractor: LoginInteractorType!
    
    // MARK: - Init
    
    init(loginInteractor: LoginInteractorType) {
        self.loginInteractor = loginInteractor
    }
    
    // MARK: - Public methods
    
    func performLogin(msisdn: String) -> Single<LoginResponse> {
        return self.loginInteractor.login(msisdn: msisdn)
    }
}
