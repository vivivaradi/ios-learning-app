//
//  DataPackage.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 06..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class RefillDataPackage: Package {
    var price: Int
    
    init(name: String, price: Int) {
        self.price = price
        super.init(name)
        
    }
}
