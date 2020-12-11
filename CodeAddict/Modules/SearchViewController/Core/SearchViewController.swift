//
//  SearchViewController.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

final class SearchViewController: UIViewController {
    private enum Constants {
        static let cellHeight: CGFloat = 108.0
    }
    
    private let tableView = UITableView()
    private let headerView = SectionView()
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private var viewModel: SearchViewModelProtocol
    
    init(with viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
        configureTableView()
    }
    
    private func configureTableView() {
        
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.fillSuperView()
        tableView.rowHeight = Constants.cellHeight
        tableView.registerTableViewCell(SearchView.self)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationController(false, title: viewModel.title )
        configureSearchController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        setupNavigationController(true, title: viewModel.backTitle )
    }
    
    private func configureSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = viewModel.placeholderTitle
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.heightAnchor.constraint(equalToConstant: CGFloat(StringRepresentationOfDigit.fifty)).isActive = true
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Int(StringRepresentationOfDigit.one)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  inSearchMode ? viewModel.filteredCount : viewModel.filteredCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchView = tableView.dequeueReusableTablewViewCell(indexPath: indexPath)
        let fetchUsers = inSearchMode ? viewModel.filterItem(at: indexPath) : viewModel.item(at: indexPath)
        cell.update(listUser: fetchUsers)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = inSearchMode ? viewModel.filterItem(at: indexPath) : viewModel.item(at: indexPath)
        viewModel.showProfileController(at: selectedData)
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func reloadTableViewData() {
        tableView.reloadData()
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        searchController.resignFirstResponder()
        viewModel.filterData(searchText: searchText)
    }
}
