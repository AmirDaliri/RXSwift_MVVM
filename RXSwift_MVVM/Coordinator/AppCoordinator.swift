//
//  AppCoordinator.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import UIKit

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
    
    var childCoordinators = [Coordinator]()
    
    // MARK: Functions
    func start() {
        let controller = MainController()
        navigationController.setViewControllers([controller], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}



