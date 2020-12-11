//
//  BaseNavigationController.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
