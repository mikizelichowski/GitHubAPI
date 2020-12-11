//
//  RepoViewModel.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 11/12/2020.
//

import Foundation
import WebKit

protocol RepoViewModelProtocol: class {
    var delegate: RepoViewModelDelegate! { get set }
    
    func onViewWillAppear()
}

protocol RepoViewModelDelegate: class {
    func loadView(_ url: URL)
}

final class RepoViewModel {
    var delegate: RepoViewModelDelegate!
    
    private let url: URL
    private let coordinator: MainViewCoordinator
    
    init(with coordinator: MainViewCoordinator, url: URL) {
        self.coordinator = coordinator
        self.url = url
    }
}

extension RepoViewModel: RepoViewModelProtocol {
    func onViewWillAppear() {
        delegate.loadView(url)
    }
}
