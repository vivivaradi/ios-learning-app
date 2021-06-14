//
//  SessionManager.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 31..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

protocol Sessionable {
    var accessToken: String? { get }
    var msisdn: String? { get }
}

class SessionManager {
    
    static let shared = SessionManager()
    
    var accessToken : String? = nil
    var msisdn : String? = nil
    
    func startSession(token: String, telnum: String) {
        accessToken = token
        msisdn = telnum
    }
    
    func endSession() {
        accessToken = nil
        msisdn = nil
    }
}
