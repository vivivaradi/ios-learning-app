//
//  DataPackageDetailsItemViewModel.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 30..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import RxSwift

struct DataPackageDetailsItemViewModel {
    
    var id: String
    var name: String
    var description: String
    var price: Int
    
    init() {
        id = ""
        name = ""
        description = ""
        price = 0
    }
    
    init(id: String, name: String, description: String, price: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
    }
}
