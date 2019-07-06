//
//  BasicAction.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation
import Alamofire

enum BasicAction: APIAction {
    case posts
    case albums
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .albums:
            return "/albums"
        case .posts:
            return "/posts"
        }
    }
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        let originalRequest = try URLRequest(url: baseURL.appending(path), method: method, headers: [:])
        let encodedRequest = try encoding.encode(originalRequest, with: actionParameters)
        return encodedRequest
    }
}

