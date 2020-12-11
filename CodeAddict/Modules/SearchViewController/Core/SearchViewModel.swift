//
//  SearchViewModel.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import Foundation

protocol SearchViewModelProtocol: class {
    var delegate: SearchViewModelDelegate! { get set }
    
    var title: String { get }
    var backTitle: String { get }
    var placeholderTitle: String { get }
    
    var filteredCount: Int { get }
    func item(at indexPath: IndexPath) -> Repo
    func filterData(searchText: String)
    func filterItem(at indexPath: IndexPath) -> Repo
    func showProfileController(at indexPath: Repo)
}

protocol SearchViewModelDelegate: class {
    func reloadTableViewData()
}

final class SearchViewModel {
    weak var delegate: SearchViewModelDelegate!
    
    private var repo = [Repo]()
    private var filterDataSource: [Repo] = []
    
    private let coordinator: MainViewCoordinator
    
    init(with coordinator: MainViewCoordinator) {
        self.coordinator = coordinator
    }
}

extension SearchViewModel: SearchViewModelProtocol {
    private enum Constants {
        static let title = "Search"
        static let backTitle = "Back"
        static let placeholderTitle = "Search"
    }
    
    var title: String { return Constants.title }
    var backTitle: String { return Constants.backTitle }
    var placeholderTitle: String { return Constants.placeholderTitle }
    
    var filteredCount: Int {
        return filterDataSource.count
    }
    
    func item(at indexPath: IndexPath) -> Repo {
        return repo[indexPath.row]
    }
    
    func filterItem(at indexPath: IndexPath) -> Repo {
        filterDataSource[indexPath.row]
    }
    
    func showProfileController(at indexPath: Repo) {
        coordinator.showProfileController(repo: indexPath)
    }
    
    func filterData(searchText: String) {
        filterDataSource = repo.filter({$0.name.contains(searchText)})
        let userRequest = gitHubRequest(name: searchText)
        userRequest.getUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                self.repo = user
                DispatchQueue.main.async {
                    self.delegate?.reloadTableViewData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
