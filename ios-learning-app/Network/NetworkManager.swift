//
//  NetworkManager.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 05. 31..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Moya

protocol NetworkingManager {
    var provider: MultiMoyaProvider { get }
}

class NetworkManager: NetworkingManager {
    
    // MARK: - Public variables
    
    var provider: MultiMoyaProvider
    
    // MARK: - Init
    
    init() {
        self.provider = MultiMoyaProvider(stubClosure: MultiMoyaProvider.delayedStub(1))
    }
}
