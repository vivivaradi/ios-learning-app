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
    if let path = bundle.path(forResource: filename, ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
        return data
    }
    return Data()
}
