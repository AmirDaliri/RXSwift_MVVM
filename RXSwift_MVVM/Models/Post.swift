//
//  Post.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
