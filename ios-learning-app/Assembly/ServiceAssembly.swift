//
//  ServiceAssembly.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 28..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(DashboardServiceType.self, initializer: DashboardService.init).inObjectScope(.container)
    }
}
