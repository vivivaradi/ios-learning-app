//
//  CurrentDataPackage.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 07..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

struct CurrentDataPackage: Codable {

    let id: String?
    let name: String?
    let description: String?
    let featured: Bool?
    let price: Int?
    let active: Bool?
    let type: String?
    let dataUsageMb: Int?
    let actualUsage: Int?
    let overfill: Int?
    let total: Int?
    let expirationDate: String?
    let maxMember: Int?
    let baseOfferIncluded: Bool?
    let activeOnSubscription: Bool?
    let upgradePoolIds: [String?]
    let offerIdsMaster: [String?]
    let offerIdsMember: [String?]
    let addonIdsMaster: [String?]
    let addonIdsMember: [String?]
    let refillIds: [String?]
    let unlimitedContentPackages: [String?]
    let psmCodes: PsmCodes?
}
