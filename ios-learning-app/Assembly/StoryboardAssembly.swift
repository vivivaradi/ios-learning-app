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
        container.autoregister(LoginViewModelType.self, initializer: LoginViewModel.init)
        container.storyboardInitCompleted(LoginViewController.self, initCompleted: { r, c in
            c.viewModel = r.resolve(LoginViewModelType.self)!
        })
    }
}

class DashboardAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(DashboardViewModelType.self, initializer: DashboardViewModel.init)
        container.storyboardInitCompleted(DashboardViewController.self, initCompleted: { r, c in
            c.viewModel = r.resolve(DashboardViewModelType.self)!
        })
        container.autoregister(DataPackageDetailsViewModelType.self, initializer: DataPackageDetailsViewModel.init)
        container.storyboardInitCompleted(DataPackageDetailsViewController.self) { r, c in
            c.viewModel = r.resolve(DataPackageDetailsViewModelType.self)!
        }
        container.autoregister(DataPackageConfirmationViewModelType.self, initializer: DataPackageConfirmationViewModel.init)
        container.storyboardInitCompleted(DataPackageConfirmationViewController.self) { r, c in
            c.viewModel = r.resolve(DataPackageConfirmationViewModelType.self)!
        }
        container.autoregister(DataPackageResultViewModelType.self, initializer: DataPackageResultViewModel.init)
        container.storyboardInitCompleted(DataPackageResultViewController.self) { r, c in
            c.viewModel = r.resolve(DataPackageResultViewModelType.self)!
        }
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
