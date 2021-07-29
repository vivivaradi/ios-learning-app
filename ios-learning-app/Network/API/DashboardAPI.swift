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
    case getDashboard
    case getPackage(id: String)
}

// MARK: TargetType protocol implementation
extension DashboardAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://vivi.mock.com")!
    }
    
    var path: String {
        switch self {
        case .getDashboard: return "/dashboard"
        case .getPackage(let id): return "/dashboard/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDashboard, .getPackage(_):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getDashboard:
            return stubbedResponse("dashboard")
        case .getPackage(let id):
            return stubbedResponse("dashboard_\(id)")
        }
    }
    
    var task: Task {
        switch self {
        case .getDashboard, .getPackage(_):
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
}
