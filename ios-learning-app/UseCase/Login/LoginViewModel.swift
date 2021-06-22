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
}

class LoginViewModel: LoginViewModelType {
    let container = Container.shared
    
    var sessionManager: SessioningManager
    var networkManager: NetworkingManager
    
    init() {
        sessionManager = container.resolve(SessioningManager.self)!
        networkManager = container.resolve(NetworkingManager.self)!
    }
}
