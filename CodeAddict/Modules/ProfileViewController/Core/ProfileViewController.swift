//
//  ProfileViewController.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 10/12/2020.
//

import UIKit

final class ProfileViewController: UIViewController {
    private enum Constants {
        static let heightHeader: CGFloat = 300.0
        static let heightSection: CGFloat = 200.0
    }
    
    private let tableView = UITableView()
    let profileHeader = ProfileViewHeader()
    let sectionView = ProfileSectionView()
    let footerView = FooterView()
    var searchController: SearchViewController?
    
    private var viewModel: ProfileViewModelProtocol
    
    init(with viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        setupUI()
        showViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        setupNavigationController(false)
    }
    
    
    private func configureTableView() {
        
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTableViewCell(ProfileView.self)
        tableView.rowHeight = CGFloat(StringRepresentationOfDigit.hundred)
    }
    
    private func setupUI() {
        
        [profileHeader,sectionView, tableView, footerView].forEach { view.addSubview($0)}
        profileHeader.anchor(top: view.topAnchor,
                             left: view.leftAnchor,
                             right: view.rightAnchor)
        profileHeader.heightAnchor.constraint(equalToConstant: Constants.heightHeader).isActive = true
        sectionView.anchor(top: profileHeader.bottomAnchor,
                           left: view.leftAnchor,
                           right: view.rightAnchor,
                           height: Constants.heightSection)
        tableView.anchor(top: sectionView.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: CGFloat(StringRepresentationOfDigit.five),
                         paddingLeft: CGFloat(StringRepresentationOfDigit.sixteen),
                         paddingRight: CGFloat(StringRepresentationOfDigit.sixteen))
        footerView.anchor(top: tableView.bottomAnchor,
                          left: view.leftAnchor,
                          bottom: view.bottomAnchor,
                          right: view.rightAnchor,
                          paddingBottom: CGFloat(StringRepresentationOfDigit.ten))
        footerView.heightAnchor.constraint(equalToConstant: CGFloat(StringRepresentationOfDigit.hundred)).isActive = true
    }
}

extension ProfileViewController: ProfileViewModelDelegate {    
    func reloadDataTableView() {
        tableView.reloadData()
    }
    
    func webView() {
        sectionView.webRepoClosure = { [weak self] url in
            guard let self = self else { return }
            self.viewModel.showOnlineWeb(repo: url)
        }
    }
    
    func showActivityView(controllers: UIActivityViewController, repo: Repo) {
        self.present(controllers, animated: true, completion: nil)
    }
    
    
    func showViewController() {
        footerView.shareHandleTappedClosure = { [weak self] activity, repo in
            self?.viewModel.shareLink(controller: activity, repo: repo)
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(StringRepresentationOfDigit.three)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProfileView = tableView.dequeueReusableTablewViewCell(indexPath: indexPath)
        return cell
    }
}
