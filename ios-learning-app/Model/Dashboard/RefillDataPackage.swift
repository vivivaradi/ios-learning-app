//
//  DataPackage.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 06..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class RefillDataPackage: Codable {

    var id: String?
    var name: String?
    var description: String?
    var active: Bool?
    var price: Int?
    var psmCodes: PsmCodes?
    
    init() { }
    
    init(id: String?, name: String?, description: String?, active: Bool?, price: Int?, psmCodes: PsmCodes?) {
        self.id = id
        self.name = name
        self.description = description
        self.active = active
        self.price = price
        self.psmCodes = psmCodes
    }
}
