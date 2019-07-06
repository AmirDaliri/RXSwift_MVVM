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
        
        modeSelectedSubject
            .bind(onNext: targetSelected)
            .disposed(by: disposeBag)
        
        viewModelSelectedSubject
            .bind(onNext: navigationDelegate.viewModelSelected)
            .disposed(by: disposeBag)
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
    
    // MARK: Functions
    func targetSelected(_ target: FetchTarget) {
        switch target {
        case .albums:
            service
                .load(ArrayResource<Album>(action: BasicAction.albums))
                .map { $0.map(AlbumCellViewModel.init) }
                .map { item in return item.map(Either<AlbumCellViewModelType, PostCellViewModelType>.left) }
                .subscribe(dataSubject)
                .disposed(by: disposeBag)
            
        case .posts:
            service
                .load(ArrayResource<Post>(action: BasicAction.posts))
                .map { $0.map(PostCellViewModel.init) }
                .map { item in return item.map(Either<AlbumCellViewModelType, PostCellViewModelType>.right) }
                .subscribe(dataSubject)
                .disposed(by: disposeBag)
        }
    }
}
