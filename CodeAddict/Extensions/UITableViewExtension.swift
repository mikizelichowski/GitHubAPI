//
//  UITableViewExtension.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

extension UITableView {
    func registerTableViewCell<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    func dequeueReusableTablewViewCell<T: UITableViewCell>(indexPath: IndexPath) -> T{
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
