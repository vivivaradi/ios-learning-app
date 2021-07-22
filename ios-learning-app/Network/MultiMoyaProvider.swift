//
//  MultiMoyaProvider.swift
//  ios-learning-app
//
//  Created by New Mobile App on 2021. 06. 01..
//  Copyright © 2021. Vivi Learns Everything. All rights reserved.
//

import Foundation
import Moya
import RxSwift

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

extension Reactive where Base: MultiMoyaProvider {
    func requestDefault<T: TargetType>(_ target: T, callbackQueue: DispatchQueue? = nil) -> Observable<Response> {
        return base.rx.request(MultiTarget(target), callbackQueue: callbackQueue)
            .asObservable()
    }
    
    func requestMapped<T, M>(_ target: T, callbackQueue: DispatchQueue? = nil) -> Observable<M> where T: TargetType, M: Codable {
        return requestDefault(target, callbackQueue: callbackQueue)
            .map(M.self)
    }
    
    func requestMappedSingle<T, M>(_ target: T, callbackQueue: DispatchQueue? = nil) -> Single<M> where T: TargetType, M: Codable {
        return requestDefault(target, callbackQueue: callbackQueue)
            .map(M.self)
            .asSingle()
    }
}
