//
//  DashboardData.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class DashboardData: Codable {
    var status: String?
    var responseType: String?
    var postpaid: Postpaid?

    init() { }
    
    init(status: String?, responseType: String?, postpaid: Postpaid?) {
        self.status = status
        self.responseType = responseType
        self.postpaid = postpaid
    }
}
