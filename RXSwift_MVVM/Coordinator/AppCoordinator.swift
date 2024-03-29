//
//  AppCoordinator.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import UIKit

/// Main app coordinator that manages basic app flow
class AppCoordinator: Coordinator {
    
    // Init and deinit
    init(_ window: UIWindow) {
        self.window = window
    }
    
    deinit {
        print("\(self) dealloc")
    }
    
    // MARK: Properties
    private let navigationController = UINavigationController()
    private let window: UIWindow
    var rootViewController: UIViewController {
        return navigationController
    }
    
    var networkService: NetworkService = CachedNetworkServiceImpl(BasicNetworkServiceImpl())
    var childCoordinators = [Coordinator]()
    
    // MARK: Functions
    func start() {
        let controller = MainController(MainControllerViewModel(networkService, navigationDelegate: self))
        navigationController.setViewControllers([controller], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: NavigationDelegate {
    func viewModelSelected(_ viewModel: Either<AlbumCellViewModelType, PostCellViewModelType>) {
        let controller: UIViewController = viewModel.either(ifLeft: { (albumViewModel) -> UIViewController in
            
            let photosController = PhotosController(PhotosControllerViewModel(networkService, albumID: albumViewModel.id))
            return photosController
            
        }) { (postViewModel) -> UIViewController in
            
            let commentsController = CommentsController(CommentsControllerViewModel(networkService, postID: postViewModel.id))
            return commentsController
            
        }
        navigationController.pushViewController(controller, animated: true)
    }
}
