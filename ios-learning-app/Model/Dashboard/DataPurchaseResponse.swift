//
//  DataPurchaseResponse.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 08. 03..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class DataPurchaseResponse: Codable {
    var status: String?
    var title: String?
    var description: String?
    
    init() { }
    
    init(status: String?, title: String?, description: String?) {
        self.status = status
        self.title = title
        self.description = description
    }
}
