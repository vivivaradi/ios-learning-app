//
//  MultiMoyaProvider.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 01..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Moya

open class MultiMoyaProvider: MoyaProvider<MultiTarget> {
    
    override public init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                         requestClosure: @escaping RequestClosure = MultiMoyaProvider.defaultRequestMapping,
                         stubClosure: @escaping StubClosure =  MoyaProvider.neverStub ,
                         callbackQueue: DispatchQueue? = nil,
                         session: Session = MoyaProvider<MultiTarget>.defaultAlamofireSession(),
                         plugins: [PluginType] = [],
                         trackInflights: Bool = false) {
        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: callbackQueue, session: session, plugins: plugins, trackInflights: trackInflights)
    }
}
