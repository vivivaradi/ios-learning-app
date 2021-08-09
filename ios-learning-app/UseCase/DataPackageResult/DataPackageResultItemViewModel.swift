//
//  DataPackageResultItemViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 08. 04..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct DataPackageResultItemViewModel {
    let status: String
    let title: String
    let description: String
    let isDataValid: Bool
    
    init() {
        self.status = ""
        self.title = ""
        self.description = ""
        self.isDataValid = false
    }
    
    init(dataPurchaseResponse: DataPurchaseResponse) {
        self.status = dataPurchaseResponse.status ?? ""
        self.title = dataPurchaseResponse.title ?? ""
        self.description = dataPurchaseResponse.description ?? ""
        self.isDataValid = !self.title.isEmpty
    }
    
    init(status: String, title: String, description: String) {
        self.status = status
        self.title = title
        self.description = description
        self.isDataValid = true
    }
}

extension DataPackageResultItemViewModel: Equatable {
    static func == (lhs: DataPackageResultItemViewModel, rhs: DataPackageResultItemViewModel) -> Bool {
        return lhs.status == rhs.status && lhs.title == rhs.title && lhs.description == rhs.description
    }
}
