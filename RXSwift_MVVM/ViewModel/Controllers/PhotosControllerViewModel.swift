//
//  PhotosControllerViewModel.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol PhotosControllerViewModelType {
    var viewModelsDriver: Driver<[PhotoCellViewModelType]> { get }
}

class PhotosControllerViewModel: PhotosControllerViewModelType {
    
    init(_ service: NetworkService, albumID: Int) {
        self.service = service
        
        service
            .load(ArrayResource<Photo>(action: AdvancedAction.photos(albumID: albumID)))
            .map {
                $0.map(PhotoCellViewModel.init)
            }
            .subscribe(viewModelsSubject)
            .disposed(by: disposeBag)
    }
    
    deinit {
        print("\(self) dealloc")
    }
    private let disposeBag = DisposeBag()
    private let service: NetworkService
    private let viewModelsSubject = BehaviorSubject<[PhotoCellViewModelType]>(value: [])
    
    var viewModelsDriver: SharedSequence<DriverSharingStrategy, [PhotoCellViewModelType]> {
        return viewModelsSubject.asDriver(onErrorJustReturn: [])
    }
    
}

