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
    
    init() {
        self.status = ""
        self.title = ""
        self.description = ""
    }
    
    init(dataPurchaseResponse: DataPurchaseResponse) {
        self.status = dataPurchaseResponse.status ?? ""
        self.title = dataPurchaseResponse.title ?? ""
        self.description = dataPurchaseResponse.description ?? ""
    }
}
