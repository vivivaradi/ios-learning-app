//
//  LoginResponse.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 22..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

public struct LoginResponse: Codable {
    var accessToken: String?
    
    init() { }
    
    init(accessToken: String?) {
        self.accessToken = accessToken
    }
}

extension LoginResponse: Equatable {
    public static func == (lhs: LoginResponse, rhs: LoginResponse) -> Bool {
        return lhs.accessToken == rhs.accessToken
    }
}
