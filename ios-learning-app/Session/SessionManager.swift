//
//  SessionManager.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 31..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

protocol SessioningManager {
    var accessToken: String? { get }
    var msisdn: String? { get }
    
    func startSession(token: String, telnum: String)
    
    func endSession()
}

class SessionManager: SessioningManager {
    
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
