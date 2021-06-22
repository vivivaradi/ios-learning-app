//
//  Container.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 22..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    static var shared : Container {
        let container = Container()
        
        container.register(SessioningManager.self) { _ in
            SessionManager.shared
        }
        container.register(NetworkingManager.self) { _ in
            NetworkManager.shared
        }
        container.register(LoginViewModelType.self) { _ in
            LoginViewModel()
        }
        
        return container
    }
}
