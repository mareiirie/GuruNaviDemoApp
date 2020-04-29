//
//  WebAPIRequestProtocol.swift
//  GnaviApp
//
//  Created by 入江真礼 on 2020/04/12.
//  Copyright © 2020 入江真礼. All rights reserved.
//

import Alamofire

protocol WebAPIRequestProtocol: class {
    var baseURLString: String { get }
    var httpMethod: HTTPMethod { get }
    var path: String { get }
    var header: [String: String] { get }
    var bodys: [String: Any] { get }
    var parameters: [String: Any] { get }
}

extension WebAPIRequestProtocol {

    var baseURLString: String {
        return "https://api.gnavi.co.jp/RestSearchAPI/v3"
    }

    var endPoint: String {
        return ""
    }

    var httpMethod: HTTPMethod {
        return .post
    }

    var path: String {
        return ""
    }

    var header: [String: String] {
        return [
            "header" : ""
        ]
    }
    
    var bodys: [String: Any] {
        return [:]
    }

    var parameters: [String: Any] {
        return [:]
    }
}
