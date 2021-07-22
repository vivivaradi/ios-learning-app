//
//  Postpaid.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct Postpaid: Codable {
    
    let cumulativeActualDataUsage: Int?
    let cumulativeTotalData: Int?
    let cumulativeActualSharedDataUsage: Int?
    let cumulativeTotalSharedData: Int?
    let warningText: String?
    let unlimitedContentPackageMessage: String?
    let noRedir: Bool?
    let entitlements: [String?]
    let poolEntitlements: [String?]
    let poolId: String
    let poolRole: String?
    let offers: [String?]
    let pools: [CurrentDataPackage?]
    let refills: [RefillDataPackage?]
    let unlimitedContentPackages: [UnlimitedContentPackage?]
}
