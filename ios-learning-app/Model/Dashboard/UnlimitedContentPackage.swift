//
//  UnlimitedContentPackage.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct UnlimitedContentPackage: Codable {
    
    let id: String?
    let name: String?
    let description: String?
    let featured: Bool?
    let price: Int?
    let active: Bool?
    let activeOnSubscription: Bool?
    let psmCodes: PsmCodes?
}
