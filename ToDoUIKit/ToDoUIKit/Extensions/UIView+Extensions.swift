//
//  UIView+Extensions.swift
//  ToDoUIKit
//
//  Created by Ricardo Prestes on 21/09/25.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for subview in views {
            subview.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(subview)
        }
    }
    
    @discardableResult
    func top(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerX(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func width(_ constant: CGFloat) -> UIView {
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(_ constant: CGFloat) -> UIView {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
}
