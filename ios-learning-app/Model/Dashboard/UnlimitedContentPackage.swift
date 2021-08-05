//
//  UnlimitedContentPackage.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class UnlimitedContentPackage: Codable {
    
    var id: String?
    var name: String?
    var description: String?
    var featured: Bool?
    var price: Int?
    var active: Bool?
    var activeOnSubscription: Bool?
    var psmCodes: PsmCodes?
    
    init() { }
    
    init(id: String?, name: String?, description: String?, featured: Bool?, price: Int?, active: Bool?, activeOnSubscription: Bool?, psmCodes: PsmCodes?) {
        self.id = id
        self.name = name
        self.description = description
        self.featured = featured
        self.price = price
        self.active = active
        self.activeOnSubscription = activeOnSubscription
        self.psmCodes = psmCodes
    }
}
