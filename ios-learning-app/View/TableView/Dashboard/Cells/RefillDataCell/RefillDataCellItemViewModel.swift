//
//  RefillDataCellItemViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 23..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct RefillDataCellItemViewModel: Codable {
    let name: String
    let price: Int
}

extension RefillDataCellItemViewModel: Equatable {
    static func == (lhs: RefillDataCellItemViewModel, rhs: RefillDataCellItemViewModel) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
}
