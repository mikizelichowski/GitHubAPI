//
//  RepoViewController.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 11/12/2020.
//

import UIKit
import WebKit

final class RepoViewController: UIViewController {
    private let webView: WKWebView = {
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        return webView
    }()
    
    private var viewModel: RepoViewModelProtocol
    
    init(with viewModel: RepoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationController(false)
        viewModel.onViewWillAppear()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(webView)
        webView.fillSuperView()
    }
}

extension RepoViewController: RepoViewModelDelegate {
    func loadView(_ url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
