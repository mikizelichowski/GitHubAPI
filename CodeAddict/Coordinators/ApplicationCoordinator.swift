//
//  ApplicationCoordinator.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

protocol Coordinator: class {
    var childCoordinator: [Coordinator] { get }
    func childDidFinish(_ childCoordinator: Coordinator)
    
    func start()
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator) {}
}

final class ApplicationCoordinator: Coordinator {
    private(set) var childCoordinator: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let navigationController = UINavigationController()
        let mainViewCoordinator = MainViewCoordinator(navigationController: navigationController)
        childCoordinator.append(mainViewCoordinator)
        mainViewCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
