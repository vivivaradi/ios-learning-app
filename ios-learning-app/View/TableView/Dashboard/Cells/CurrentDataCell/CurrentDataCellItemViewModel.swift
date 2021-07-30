//
//  CurrentDataCellItemViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 23..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct CurrentDataCellItemViewModel: Codable {
    let id: String
    let name: String
    let totalData: Int
    let usedData: Int
    let daysLeft: Int
    
    init(package: CurrentDataPackage) {
        self.id = package.id ?? ""
        self.name = package.name ?? ""
        self.totalData = package.total ?? 0
        self.usedData = package.actualUsage ?? 0
        let dateString = package.expirationDate ?? ""
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let endDate = formatter.date(from: dateString) ?? Date()
        self.daysLeft = RemainingTime.getDays(until: endDate)
    }
}

extension CurrentDataCellItemViewModel: Equatable {
    static func == (lhs: CurrentDataCellItemViewModel, rhs: CurrentDataCellItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
