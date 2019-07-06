//
//  MainControllerViewModel.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainControllerViewModelType: class {
    var modeSelectedSubject: PublishSubject<FetchTarget> { get }
    var viewModelSelectedSubject: PublishSubject<Either<AlbumCellViewModelType, PostCellViewModelType>> { get }
    var cellViewModelsDriver: Driver<[Either<AlbumCellViewModelType, PostCellViewModelType>]> { get }
}

final class MainControllerViewModel: MainControllerViewModelType {
    
    // MARK: Init and deinit
    init(_ service: NetworkService, navigationDelegate: NavigationDelegate) {
        self.service = service
    }
    deinit {
        print("\(self) dealloc")
    }
    
    // MARK: Properties
    private let service: NetworkService
    private let dataSubject = BehaviorSubject<[Either<AlbumCellViewModelType, PostCellViewModelType>]>(value: [])
    private let disposeBag = DisposeBag()
    
    var modeSelectedSubject = PublishSubject<FetchTarget>()
    var viewModelSelectedSubject = PublishSubject<Either<AlbumCellViewModelType, PostCellViewModelType>>()
    
    var cellViewModelsDriver: Driver<[Either<AlbumCellViewModelType, PostCellViewModelType>]> {
        return dataSubject.asDriver(onErrorJustReturn: [])
    }
    
}

