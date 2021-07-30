//
//  RefillDataCellItemViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 23..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct RefillDataCellItemViewModel: Codable {
    let id: String
    let name: String
    let price: Int
    
    init(package: RefillDataPackage) {
        self.id = package.id ?? ""
        self.name = package.name ?? ""
        self.price = package.price ?? 0
    }
    
    init(package: UnlimitedContentPackage) {
        self.id = package.id ?? ""
        self.name = package.name ?? ""
        self.price = package.price ?? 0
    }
}

extension RefillDataCellItemViewModel: Equatable {
    static func == (lhs: RefillDataCellItemViewModel, rhs: RefillDataCellItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
