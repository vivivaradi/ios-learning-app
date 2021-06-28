//
//  ManagerAssembly.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 28..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ManagerAssembly : Assembly {
    func assemble(container: Container) {
        container.autoregister(SessioningManager.self, initializer: SessionManager.init).inObjectScope(.container)
        container.autoregister(NetworkingManager.self, initializer: NetworkManager.init).inObjectScope(.container)
    }
    
    
}
