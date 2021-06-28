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
    
    func performLogin(msisdn: String, password: String)
}

class LoginViewModel: LoginViewModelType {
    
    var sessionManager: SessioningManager
    var networkManager: NetworkingManager
    
    init() {
    }
    
    func performLogin(msisdn: String, password: String) {
        <#code#>
    }
}
