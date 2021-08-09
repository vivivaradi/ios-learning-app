//
//  Postpaid.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class Postpaid: Codable {
    var cumulativeActualDataUsage: Int?
    var cumulativeTotalData: Int?
    var cumulativeActualSharedDataUsage: Int?
    var cumulativeTotalSharedData: Int?
    var warningText: String?
    var unlimitedContentPackageMessage: String?
    var noRedir: Bool?
    var entitlements: [String]?
    var poolEntitlements: [String]?
    var poolId: String?
    var poolRole: String?
    var offers: [String]?
    var pools: [CurrentDataPackage]?
    var refills: [RefillDataPackage]?
    var unlimitedContentPackages: [UnlimitedContentPackage]?
    
    init() { }
    
    init(cumulativeActualDataUsage: Int?, cumulativeTotalData: Int?, cumulativeActualSharedDataUsage: Int?, cumulativeTotalSharedData: Int?, warningText: String?, unlimitedContentPackageMessage: String?, noRedir: Bool?, entitlements: [String]?, poolEntitlements: [String]?, poolId: String?, poolRole: String?, offers: [String]?, pools: [CurrentDataPackage]?, refills: [RefillDataPackage]?, unlimitedContentPackages: [UnlimitedContentPackage]?) {
        self.cumulativeActualDataUsage = cumulativeActualDataUsage
        self.cumulativeTotalData = cumulativeTotalData
        self.cumulativeActualSharedDataUsage = cumulativeActualSharedDataUsage
        self.cumulativeTotalSharedData = cumulativeTotalSharedData
        self.warningText = warningText
        self.unlimitedContentPackageMessage = unlimitedContentPackageMessage
        self.noRedir = noRedir
        self.entitlements = entitlements
        self.poolEntitlements = poolEntitlements
        self.poolId = poolId
        self.poolRole = poolRole
        self.offers = offers
        self.pools = pools
        self.refills = refills
        self.unlimitedContentPackages = unlimitedContentPackages
    }
}
