//
//  GenderTextField.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 19.02.2023.
//

import UIKit

class GenderTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        placeholder = "Введите данные"
        textAlignment = .right
        tintColor = .clear
        font = Resources.Fonts.avenirNextRegular(with: 18)
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        !isFirstResponder
    }
}
