//
//  AdvancedAction.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Alamofire

enum AdvancedAction: APIAction {
    case comments(postID: Int)
    case photos(albumID: Int)
    
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case let .comments(postID):
            return "/posts/\(postID)/comments"
        case let .photos(albumID):
            return "/albums/\(albumID)/photos"
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        let originalRequest = try URLRequest(url: baseURL.appending(path),
                                             method: method,
                                             headers: [:])
        let encodedRequest = try encoding.encode(originalRequest,
                                                 with: actionParameters)
        return encodedRequest
    }
}


