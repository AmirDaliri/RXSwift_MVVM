//
//  PhotoCellViewModel.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation

protocol PhotoCellViewModelType {
    var title: String { get }
    var url: URL { get }
    var thumbnailUrl: URL { get }
}

struct PhotoCellViewModel: PhotoCellViewModelType {
    
    init(_ photo: Photo) {
        self.photo = photo
    }
    
    private let photo: Photo
    
    var title: String {
        return photo.title
    }
    
    var url: URL {
        return URL(string: photo.url)!
    }
    
    var thumbnailUrl: URL {
        return URL(string: photo.thumbnailUrl)!
    }
}
