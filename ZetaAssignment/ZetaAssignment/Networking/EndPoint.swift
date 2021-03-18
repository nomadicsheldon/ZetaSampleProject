//
//  EndPoint.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    var request: String {
        return base + path
    }
}

enum ZetaUrl {
    case searchUrl
}

extension ZetaUrl: Endpoint {
    var base: String {
        return "https://www.googleapis.com"
    }
    
    var path: String {
        switch self {
        case .searchUrl:
            return "/customsearch/v1"
        }
    }
    
    
}
