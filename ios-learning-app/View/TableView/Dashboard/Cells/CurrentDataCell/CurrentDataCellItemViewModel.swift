//
//  CurrentDataCellItemViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 23..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct CurrentDataCellItemViewModel: Codable {
    let name: String
    let totalData: Int
    let usedData: Int
    let daysLeft: Int
}
