//
//  UIBarButtonItem + Extension.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 22.02.2023.
//

import UIKit

extension UIBarButtonItem {
    
    static func createCustomButtom(vc: UIViewController, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "chevron-left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.tintColor = .systemBlue
        button.addTarget(vc, action: selector, for: .touchUpInside)
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.imagePadding = 1
            configuration.contentInsets = .init(top: 0, leading: -5, bottom: 0, trailing: 0)
            button.configuration = configuration
        } else {
            button.titleEdgeInsets = .init(top: 0, left: 5, bottom: 0, right: -5)
        }
        
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
}
