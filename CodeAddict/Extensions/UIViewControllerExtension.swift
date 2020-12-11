//
//  UIViewControllerExtension.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

extension UIViewController {
    func setupNavigationController(_ hide: Bool, title: String? = nil) {
        navigationController?.navigationBar.isHidden = hide
        navigationItem.title = title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
