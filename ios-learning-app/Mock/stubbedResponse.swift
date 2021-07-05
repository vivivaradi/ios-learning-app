//
//  stubbedResponse.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 16..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

func stubbedResponse(_ filename: String) -> Data {
    let bundle = Bundle.main
    if let path = bundle.url(forResource: filename, withExtension: nil),
        let data = try? Data(contentsOf: path) {
        return data
    }
    return Data()
}
