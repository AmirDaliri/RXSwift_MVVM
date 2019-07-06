//
//  AlbumCellViewModel.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation

protocol AlbumCellViewModelType {
    var title: String { get }
    var id: Int { get }
}

struct AlbumCellViewModel: AlbumCellViewModelType {
    init(_ album: Album) {
        self.album = album
    }
    
    private let album: Album
    
    var id: Int {
        return album.id
    }
    
    var title: String {
        return album.title
    }
}
