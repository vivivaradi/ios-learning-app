//
//  DateInterval.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 26..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class RemainingTime {
    static func getDays(until endDate: Date) -> Int {
        let difference = Calendar.current.dateComponents([.day], from: Date(), to: endDate)
        return difference.day ?? 0
    }
}
