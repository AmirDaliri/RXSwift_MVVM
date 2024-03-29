//
//  APIAction.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Alamofire

protocol APIAction: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var actionParameters: [String: Any] { get }
    var baseURL: String { get }
    var authHeader: [String: String] { get }
    var encoding: ParameterEncoding { get }
}

extension APIAction {
    var actionParameters: [String : Any] {
        return [:]
    }
    var authHeader: [String : String] {
        return [:]
    }
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
}
