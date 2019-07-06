//
//  CustomError.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation

struct CustomError: LocalizedError {
    let value: String
    var localizedDescription: String {
        return value
    }
}
