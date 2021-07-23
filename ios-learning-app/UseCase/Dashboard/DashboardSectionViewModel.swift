//
//  DashboardSectionViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 23..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxDataSources

enum DashboardSectionViewModel {
    case headerSection
    case mainSection(item: DashboardItemViewModel)
    case refillSection(title: String, items: [DashboardItemViewModel])
    case contentSection(title: String, items: [DashboardItemViewModel])
}

enum DashboardItemViewModel {
    case mainItem()
}
