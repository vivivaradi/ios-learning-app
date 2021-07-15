//
//  DataConverter.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 09..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

class DataConverter {
    
    static func addMeasurement(to data: Int) -> String {
        let dataString: String
        let doubleData = Double(data) / 1024.0
        if (data > 1024) {
            dataString = "\(String(format: "%.1f", doubleData))GB"
        } else {
            dataString = "\(data)MB"
        }
        return dataString
    }
}
