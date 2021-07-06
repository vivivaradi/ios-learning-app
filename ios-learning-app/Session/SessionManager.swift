//
//  SessionManager.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 31..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation

protocol SessioningManager {
    
    func startSession(token: String, telnum: String)
    func endSession()
    func isSessionActive() -> Bool
    
}

class SessionManager: SessioningManager {
    
    var accessToken : String?
    var msisdn : String?
    
    init() {}
    
    func startSession(token: String, telnum: String) {
        self.accessToken = token
        self.msisdn = telnum
    }
    
    func endSession() {
        self.accessToken = nil
        self.msisdn = nil
    }
    
    func isSessionActive() -> Bool {
        return self.accessToken != nil && self.msisdn != nil
    }
}
