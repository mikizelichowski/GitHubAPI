//
//  MainCoordinator.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

final class MainViewCoordinator: Coordinator {
    private(set) var childCoordinator: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let viewModel = SearchViewModel(with: self)
        let controller = SearchViewController( with: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func childDidFinish(_ childCoordinators: Coordinator) {
        if let index = childCoordinator.firstIndex(where: { coordinator -> Bool in
            return childCoordinators === coordinator
        }) {
            childCoordinator.remove(at: index)
        }
    }
    
    func showProfileController(repo: Repo) {
        let viewModel = ProfileViewModel(with: self)
        let controller = ProfileViewController(with: viewModel)
        controller.profileHeader.update(with: repo)
        controller.sectionView.update(repo: repo)
        controller.footerView.repo = repo
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showProfileWebView(_ url: URL) {
        let viewModel = RepoViewModel(with: self, url: url)
        let viewController = RepoViewController(with: viewModel)

        navigationController.pushViewController(viewController, animated: true)
    }
}
