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
        <#code#>
    }
    
    var path: String {
        <#code#>
    }
    
    var method: Method {
        <#code#>
    }
    
    var sampleData: Data {
        <#code#>
    }
    
    var task: Task {
        <#code#>
    }
    
    var headers: [String : String]? {
        <#code#>
    }
    
    
}
