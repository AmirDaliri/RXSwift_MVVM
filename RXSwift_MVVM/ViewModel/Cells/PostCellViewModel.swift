//
//  PostCellViewModel.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation

protocol PostCellViewModelType {
    var id: Int { get }
    var title: String { get }
    var body: String { get }
}

struct PostCellViewModel: PostCellViewModelType {
    init(_ post: Post) {
        self.post = post
    }
    
    private let post: Post
    
    var id: Int {
        return post.id
    }
    var title: String {
        return post.title
    }
    var body: String {
        return post.body
    }
}
