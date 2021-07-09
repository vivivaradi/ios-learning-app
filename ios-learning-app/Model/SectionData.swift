//
//  SectionData.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 09..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct SectionData {
    let title: String
    let data: [Package]
    
    var itemCount : Int {
        return data.count
    }
    
}
