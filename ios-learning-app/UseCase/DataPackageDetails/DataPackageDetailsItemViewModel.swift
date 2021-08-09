//
//  DataPackageDetailsItemViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 30..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxSwift

struct DataPackageDetailsItemViewModel {
    let id: String
    let name: String
    let description: String
    let price: Int
    let isDataValid: Bool
    
    init() {
        self.id = ""
        self.name = ""
        self.description = ""
        self.price = 0
        self.isDataValid = false
    }
    
    init(package: RefillDataPackage) {
        self.id = package.id ?? ""
        self.name = package.name ?? ""
        self.description = package.description ?? ""
        self.price = package.price ?? 0
        self.isDataValid = !self.id.isEmpty
    }
    
    init(package: UnlimitedContentPackage) {
        self.id = package.id ?? ""
        self.name = package.name ?? ""
        self.description = package.description ?? ""
        self.price = package.price ?? 0
        self.isDataValid = !self.id.isEmpty
    }
    
    init(id: String, name: String, description: String, price: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.isDataValid = true
    }
}

extension DataPackageDetailsItemViewModel: Equatable {
    static func == (lhs: DataPackageDetailsItemViewModel, rhs: DataPackageDetailsItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
