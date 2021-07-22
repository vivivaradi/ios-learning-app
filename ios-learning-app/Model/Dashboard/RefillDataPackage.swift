//
//  DataPackage.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 06..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct RefillDataPackage: Codable {

    let id: String?
    let name: String?
    let description: String?
    let active: Bool?
    let price: Int?
    let psmCodes: PsmCodes
}
