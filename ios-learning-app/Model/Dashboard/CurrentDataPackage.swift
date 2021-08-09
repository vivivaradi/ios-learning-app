//
//  CurrentDataPackage.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 07..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class CurrentDataPackage: Codable {
    var id: String?
    var name: String?
    var description: String?
    var featured: Bool?
    var price: Int?
    var active: Bool?
    var type: String?
    var dataUsageMb: Int?
    var actualUsage: Int?
    var overfill: Int?
    var total: Int?
    var expirationDate: String?
    var maxMember: Int?
    var baseOfferIncluded: Bool?
    var activeOnSubscription: Bool?
    var upgradePoolIds: [String]?
    var offerIdsMaster: [String]?
    var offerIdsMember: [String]?
    var addonIdsMaster: [String]?
    var addonIdsMember: [String]?
    var refillIds: [String]?
    var unlimitedContentPackages: [String]?
    var psmCodes: PsmCodes?
    
    init() { }
    
    init(id: String?, name: String?, description: String?, featured: Bool?, price: Int?, active: Bool?, type: String?, dataUsageMb: Int?, actualUsage: Int?, overfill: Int?, total: Int?, expirationDate: String?, maxMember: Int?, baseOfferIncluded: Bool?, activeOnSubscription: Bool?, upgradePoolIds: [String]?, offerIdsMaster: [String]?, offerIdsMember: [String]?, addonIdsMaster: [String]?, addonIdsMember: [String]?, refillIds: [String]?, unlimitedContentPackages: [String]?, psmCodes: PsmCodes?) {
        self.id = id
        self.name = name
        self.description = description
        self.featured = featured
        self.price = price
        self.active = active
        self.type = type
        self.dataUsageMb = dataUsageMb
        self.actualUsage = actualUsage
        self.overfill = overfill
        self.total = total
        self.expirationDate = expirationDate
        self.maxMember = maxMember
        self.baseOfferIncluded = baseOfferIncluded
        self.activeOnSubscription = activeOnSubscription
        self.upgradePoolIds = upgradePoolIds
        self.offerIdsMaster = offerIdsMaster
        self.offerIdsMember = offerIdsMember
        self.addonIdsMaster = addonIdsMaster
        self.addonIdsMember = addonIdsMember
        self.refillIds = refillIds
        self.unlimitedContentPackages = unlimitedContentPackages
        self.psmCodes = psmCodes
    }
}
