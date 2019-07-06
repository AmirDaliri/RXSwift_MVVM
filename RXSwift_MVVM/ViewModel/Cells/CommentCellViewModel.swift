//
//  CommentCellViewModel.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation

protocol CommentCellViewModelType {
    var name: String { get }
    var body: String { get }
    var email: String { get }
}

struct CommentCellViewModel: CommentCellViewModelType {
    
    init(_ comment: Comment) {
        self.comment = comment
    }
    
    private let comment: Comment
    
    var name: String {
        return comment.name
    }
    
    var body: String {
        return comment.body
    }
    
    var email: String {
        return comment.email
    }
}
