//
//  UIViewExtensions.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 18.02.2023.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
