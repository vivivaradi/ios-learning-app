//
//  PsmCodes.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class PsmCodes: Codable {
    
    var activation: String?
    var deactivation: String?
    
    init() { }
    
    init(activation: String?, deactivation: String?) {
        self.activation = activation
        self.deactivation = deactivation
    }
}
