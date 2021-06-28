//
//  AutoAssemble.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 28..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import SwinjectAutoregistration
import Swinject
import SwinjectStoryboard

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginViewModelType, initializer: LoginViewModel.init)
        container.storyboardInitCompleted(LoginViewController.self, initCompleted: { r, c in
            c.viewModel = r.resolve(LoginViewModelType.self)!
        })
    }
}

class DashboardAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(DashboardViewModelType, initializer: DashboardViewModel.init)
        container.storyboardInitCompleted(DashboardViewController.self, initCompleted: { r, c in
            c.viewModel = r.resolve(DashboardViewModelType.self)!
        })
    }
}

extension AppDelegate {
    
    var autoUiAssemblies: [Assembly] {
        return [
            LoginAssembly(),
            DashboardAssembly()
        ]
        
    }
}
