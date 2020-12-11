//
//  UIViewExtension.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
                 leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
             }
        
        if let bottom = bottom {
                 bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
             }
        
        if let right = right {
                 rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
             }
    }
    
    func centerY(inView view: UIView,
                 leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0,
                 constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
     }
    
    func fillSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
