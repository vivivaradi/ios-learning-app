//
//  MockService.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 08..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Moya

enum MockService {
    case loginUser(msisdn: String)
}

// MARK: TargetType protocol implementation
extension MockService: TargetType {
    var baseURL: URL {
        return URL(string: "https://mock.com")!
    }
    
    var path: String {
        switch self {
        case .loginUser(_): return "/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .loginUser(_):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .loginUser(let msisdn):
            return "{}".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case let .loginUser(msisdn):
            return .requestParameters(parameters: ["msisdn" : msisdn], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}

// MARK: - Helpers
private extension String {

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
