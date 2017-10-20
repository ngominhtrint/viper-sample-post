//
//  Endpoint.swift
//  Viper-Sample
//
//  Created by TriNgo on 10/20/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://fierce-cove-29863.herokuapp.com"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Posts: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/getAllPosts"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
