//
//  DashboardAPI.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 07. 21..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Moya

enum DashboardAPI {
    case getData
}

// MARK: TargetType protocol implementation
extension DashboardAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://vivi.mock.com")!
    }
    
    var path: String {
        switch self {
        case .getData: return "/dashboard"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getData:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getData:
            return stubbedResponse("dashboard")
        }
    }
    
    var task: Task {
        switch self {
        case .getData:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
