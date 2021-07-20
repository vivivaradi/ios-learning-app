//
//  InteractorAssembly.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 20..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class InteractorAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginInteractorType.self, initializer: LoginInteractor.init).inObjectScope(.container)
    }
}
