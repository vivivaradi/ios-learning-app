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
    case mainItem(item: CurrentDataCellItemViewModel)
    case refillItem(item: RefillDataCellItemViewModel)
}

extension DashboardSectionViewModel: SectionModelType {
    
    typealias Item = DashboardItemViewModel
    
    init(original: DashboardSectionViewModel, items: [DashboardItemViewModel]) {
        switch original {
        case .headerSection:
            self = .headerSection
        case .mainSection(let item):
            self = .mainSection(item: item)
        case .refillSection(let title, let items):
        self = .refillSection(title: title, items: items)
        case .contentSection(let title, let items):
            self = .contentSection(title: title, items: items)
        }
    }
    
    var items: [DashboardItemViewModel] {
        switch self {
        case .headerSection:
            return []
        case .mainSection(let item):
            return [item]
        case .refillSection(_, let items):
            return items
        case .contentSection(_, let items):
            return items
        }
    }
}
