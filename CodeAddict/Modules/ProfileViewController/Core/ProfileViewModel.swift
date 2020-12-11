//
//  ProfileViewModel.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 10/12/2020.
//

import UIKit

protocol ProfileViewModelProtocol: class {
    var delegate: ProfileViewModelDelegate! { get set }
    
    var titleAlert: String { get }
    var messageAlert: String { get }
    
    func showOnlineWeb(repo: Repo)
    func shareLink(controller:ActivityController, repo: Repo)
}

protocol ProfileViewModelDelegate: class {
    func reloadDataTableView()
    func webView()
    func showActivityView(controllers: UIActivityViewController, repo: Repo)
}

final class ProfileViewModel {
    weak var delegate: ProfileViewModelDelegate!
    
    var user: Repo?
    private let coordinator: MainViewCoordinator
    
    init(with coordinator: MainViewCoordinator) {
        self.coordinator = coordinator
    }
}

extension ProfileViewModel: ProfileViewModelProtocol {
    private enum Constants {
        static let titleAlert = "Hi"
        static let messageAlert = "This is link to my repo"
    }
    
    var titleAlert: String { return Constants.titleAlert }
    var messageAlert: String { return Constants.messageAlert }
    
    func shareLink(controller: ActivityController ,repo: Repo) {
        
        guard let url = URL(string: repo.owner.repos_url) else { return }
        let activityView = ActivityController.share(title: titleAlert, message: messageAlert, url: url)
        self.delegate.showActivityView(controllers: activityView, repo: repo)
    }
    
    func showOnlineWeb(repo: Repo) {
        
        self.user = repo
        guard let repoUrl = URL(string: repo.owner.repos_url) else { return }
        coordinator.showProfileWebView(repoUrl)
    }
}
