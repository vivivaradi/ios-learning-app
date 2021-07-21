//
//  CurrentDataPackage.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 07..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class CurrentDataPackage: Package {
    let totalData: Int
    let usedData: Int
    let expirationDate: Date
    
    init(name: String, totalData: Int, usedData: Int, expirationDate: Date) {
        self.totalData = totalData
        self.usedData = usedData
        self.expirationDate = expirationDate
        super.init(name)
        
    }
}
