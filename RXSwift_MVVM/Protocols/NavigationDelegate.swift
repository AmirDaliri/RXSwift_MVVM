//
//  NavigationDelegate.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation

protocol NavigationDelegate: class {
    func viewModelSelected(_ viewModel: Either<AlbumCellViewModelType, PostCellViewModelType>)
}
